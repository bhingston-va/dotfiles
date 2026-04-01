       Cmd         |  Where   |      What
-------------------|----------|--------------------------------------------------------
claude --resume    |Shell     |Opens interactive TUI to pick/search past sessions.
claude -r <id/name>|Shell     |Instantly reloads a specific session by ID or Name.
claude -c          |Shell     |Shortcut to resume the most recent session.
/rename <name>     |Inside CLI|Gives the current session a readable label for the list.
/agents            |Inside CLI|"Opens the UI to create, edit, or switch sub-agents."
/stats             |Inside CLI|Shows token usage and files changed in this session.
/compact           |Inside CLI|Shrinks history to save context while keeping progress.
