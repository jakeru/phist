# Keep the history persistent.
# Code from:
# http://eli.thegreenplace.net/2013/06/11/keeping-persistent-history-in-bash
bash_persistent_history()
{
    # Extract date and the actual command from the latest entry
    # in the Bash history.
    # The date is supposed to consist of two fields (date and time)
    # separated by one space character.
    [[
	$(history 1) =~ ^\ *[0-9]+\ +([^\ ]+\ [^\ ]+)\ +(.*)$
    ]]
    
    local date_part="${BASH_REMATCH[1]}"
    local command_part="${BASH_REMATCH[2]}"
    
    # Ensure the command is different from the command last written.
    if [ "$command_part" != "$PERSISTENT_HISTORY_LAST" ]
    then
	# Write the date and the command to the persistent history
	# file and remember which command was written.
	echo "$date_part" "|" "$command_part" >> ~/.persistent_history
	export PERSISTENT_HISTORY_LAST="$command_part"
    fi
}

# Run the function log_bash_persistent_history when the Bash prompt
# is shown.
PROMPT_COMMAND="bash_persistent_history"

# Make each Bash session remember a decent number of commands.
HISTSIZE=500

# Configure Bash to not store command history for each session.
HISTFILESIZE=0

# Don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options.
HISTCONTROL=ignorespace:ignoredups

# Format dates using the ISO 8601 standard.
# Note that the regex expression in the function bash_persistent_history()
# will need to be updated if the date format is changed to anything that
# does not contain two fields separated by one space character.
HISTTIMEFORMAT="%Y-%m-%d %T "

# Setup aliases
# Search for a command in the persisent history file.
alias phgrep='cat ~/.persistent_history|grep'
# Search the history belonging to the current session.
alias hgrep='history|grep'
# See the latest executed commands stored in the persistent history file.
alias phist='tail -n 500 ~/.persistent_history'
