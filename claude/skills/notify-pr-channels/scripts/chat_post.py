#!/usr/bin/env python3
"""Post a PR notification to Google Chat channels.

Usage:
    python3 chat_post.py <pr_url> <pr_title>

Posts to:
  - Personal team PR channel (AAAAIj8WMWc) — @mentions Craig and Daniel
  - Snapcats channel (AAAAAHjNt6A) — no mentions

Auth: OAuth via GCP secret + cached refresh token at
      ~/.config/google-chat-cli/credentials-rw.json
"""
import json, subprocess, sys, urllib.request, urllib.parse
from pathlib import Path

CLIENT_ID = "642433220657-955eqfa32mlb0o3koe8g4qmuv1ue414s.apps.googleusercontent.com"
CREDS_FILE = Path('/Users/bhingston/.config/google-chat-cli/credentials-rw.json')

# Team members (Google Chat user IDs)
CRAIG_ID = "users/101609381686230694100"   # Craig Kumick
DANIEL_ID = "users/107059066615888383168"  # Daniel Ngo

SPACES = {
    'team':     'AAAAIj8WMWc',  # Personal team PR channel
    'snapcats': 'AAAAAHjNt6A',  # Snapcats channel
}


def get_access_token():
    client_secret = subprocess.run(
        ['gcloud', 'secrets', 'versions', 'access', 'latest',
         '--secret=google-chat-oauth-client-secret', '--project=repcore-prod'],
        capture_output=True, text=True,
    ).stdout.strip()
    creds = json.loads(CREDS_FILE.read_text())
    data = urllib.parse.urlencode({
        'client_id': CLIENT_ID, 'client_secret': client_secret,
        'refresh_token': creds['refresh_token'], 'grant_type': 'refresh_token',
    }).encode()
    resp = json.loads(urllib.request.urlopen(
        urllib.request.Request('https://oauth2.googleapis.com/token', data=data, method='POST')
    ).read())
    return resp['access_token']


def post_message(access_token, space_id, text):
    body = json.dumps({'text': text}).encode()
    req = urllib.request.Request(
        f'https://chat.googleapis.com/v1/spaces/{space_id}/messages',
        data=body, method='POST',
    )
    req.add_header('Authorization', f'Bearer {access_token}')
    req.add_header('Content-Type', 'application/json')
    try:
        urllib.request.urlopen(req).read()
        print(f"Posted to {space_id}")
    except urllib.error.HTTPError as e:
        print(f"Error posting to {space_id}: {e.code} {e.read().decode()[:300]}")


def main():
    if len(sys.argv) < 3:
        print("Usage: chat_post.py <pr_url> <pr_title>")
        sys.exit(1)

    pr_url, pr_title = sys.argv[1], sys.argv[2]
    access_token = get_access_token()

    post_message(access_token, SPACES['team'], f'{pr_title}\n{pr_url} <{CRAIG_ID}> <{DANIEL_ID}>')
    post_message(access_token, SPACES['snapcats'], f'{pr_title}\n{pr_url}')


if __name__ == '__main__':
    main()
