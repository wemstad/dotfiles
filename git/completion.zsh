# Uses git's autocompletion for inner commands. Assumes an install of git's
# bash `git-completion` script at $completion below (this is where Homebrew
# tosses it, at least).
# Changed to use zsh autocomplietion instaid.
completion=/usr/local/share/zsh/site-functions

if test -f $completion
then
  source $completion
fi
