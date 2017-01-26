# Persistent history in Bash

On a standard installation the Bash history gets overwritten when
multiple sessions of it are used. Using multiple sessions is a very
common way of working so this is probably a problem recognised by many
users.

By executing this script during login, all commands executed through
Bash will be kept forever in the file $HOME/.persistent_history.

The code to make Bash history persistent is borrowed from a great blog
post written by Eli Bendersky at:

http://eli.thegreenplace.net/2013/06/11/keeping-persistent-history-in-bash.

# Installation

1. Put the file phist.sh at a place you find convenient, e.g. in the
   directory $HOME/phist/.

2. To make the script run when you login, add this line somewhere in
   your $HOME/.bashrc file:   
   ```
   source $HOME/phist/phist.sh
   ```
3. A few aliases and environment variables are now setup to enable
   persistent history.

# Usage

The commands you run through Bash will now be saved into the file
$HOME/.persistent_history. All Bash sessions share this single file.

Each Bash session does have its own history as before. When you use
the *history* command or use the up/down arrows, you will only see
the history that belongs to the current session.

## phist
If you want to see the global and persistent history you should run the
*phist* alias which is defined by installing this script. It will give you
the 500 latest written commands.

## phgrep
When you know you have used sed some time ago to remove trailing whitespace
in a file, just type:

```
phgrep sed
```

The command line for that command will then be shown for you.

## hgrep
This alias is also defined for your convenience. It searches the history that
belongs to the current Bash session only.
