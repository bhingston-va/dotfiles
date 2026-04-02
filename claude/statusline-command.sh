#!/usr/bin/env bash

input=$(cat)

# --- State indicator: thinking vs waiting ---
# current_usage is non-null when an API call has been made (active/post-active turn)
# null means no messages exchanged yet (idle/waiting for first input)
current_usage=$(echo "$input" | jq -r '.context_window.current_usage')
if [ "$current_usage" = "null" ] || [ -z "$current_usage" ]; then
    state_icon="💤"
else
    state_icon="🤔"
fi

# --- Token burn tracker ---
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
remaining_pct=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')
input_tokens=$(echo "$input" | jq -r '.context_window.current_usage.input_tokens // empty')
context_size=$(echo "$input" | jq -r '.context_window.context_window_size // empty')

# Build a 10-char progress bar from a percentage integer
make_bar() {
    local pct=$1
    local filled=$(( pct * 10 / 100 ))
    local empty=$(( 10 - filled ))
    local bar=""
    local i
    for (( i = 0; i < filled; i++ )); do bar="${bar}█"; done
    for (( i = 0; i < empty;  i++ )); do bar="${bar}░"; done
    echo "$bar"
}

if [ -n "$used_pct" ] && [ -n "$input_tokens" ] && [ -n "$context_size" ]; then
    used_pct_int=$(printf '%.0f' "$used_pct")
    # Colour: green < 50%, yellow 50-79%, red >= 80%
    if [ "$used_pct_int" -ge 80 ]; then
        color="\e[0;31m"   # red
    elif [ "$used_pct_int" -ge 50 ]; then
        color="\e[0;33m"   # yellow
    else
        color="\e[0;32m"   # green
    fi
    bar=$(make_bar "$used_pct_int")
    token_str="${color}${input_tokens}/${context_size} ${bar} ${used_pct_int}%\e[m"
elif [ -n "$used_pct" ]; then
    used_pct_int=$(printf '%.0f' "$used_pct")
    if [ "$used_pct_int" -ge 80 ]; then
        color="\e[0;31m"
    elif [ "$used_pct_int" -ge 50 ]; then
        color="\e[0;33m"
    else
        color="\e[0;32m"
    fi
    bar=$(make_bar "$used_pct_int")
    token_str="${color}${bar} ${used_pct_int}%\e[m"
else
    token_str="\e[2mno data\e[m"
fi

printf "%s  \e[1mTokens:\e[m %b" "$state_icon" "$token_str"
