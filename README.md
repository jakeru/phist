# Persistent history in Bash

On a standard installation the Bash history gets overwritten when
multiple instances of it are used. Using multiple instances is a very
standard way of working so this should be a problem recognised by many
users.

By executing this script during login, all commands executed through
Bash will be kept forever in the file ~/.persistant_history.

The code to make Bash history persistent is borrowed from a great blog
post written by Eli Bendersky at:

http://eli.thegreenplace.net/2013/06/11/keeping-persistent-history-in-bash.

# Installation

1. Put the file phist.sh at a place you find convenient, i.e. in the
   directory $HOME/phist/.

2. To make the script run when you login, add this line somewhere in
   your $HOME/.bashrc file:   
   ```
   $HOME/phist/phist.sh
   ```
