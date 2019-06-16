# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh
export PYTHON=$HOME/.pyenv/versions/3.6.8/envs/python3/lib/python3.6/site-packages

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#export ZSH_THEME="robbyrussell"
export ZSH_THEME="spaceship"
SPACESHIP_PROMPT_ADD_NEWLINE="true"
SPACESHIP_CHAR_SYMBOL="\uf0e7"
SPACESHIP_CHAR_PREFIX="\uf296"
SPACESHIP_CHAR_SUFFIX=(" ")
SPACESHIP_CHAR_COLOR_SUCCESS="yellow"
SPACESHIP_PROMPT_DEFAULT_PREFIX="$USER"
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true"
SPACESHIP_USER_SHOW="true"
# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git textmate osx ruby)

source $ZSH/oh-my-zsh.sh
source $(dirname $(gem which colorls))/tab_complete.sh
source $HOME/.oh-my-zsh/custom/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Customize to your needs...
# added my path 2011.7.19
export PATH=/usr/local/bin:/bin:/usr/local/sbin:~/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/os/.pyenv/bin

# added RVM stuff
# load RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# copied from .bash_aliases 2001.07.19
# -------------------------------------------------------------------
# some alias settings, just for fun
# -------------------------------------------------------------------
alias 'today=calendar -A 0 -f /usr/share/calendar/calendar.mark | sort'
alias 'dus=du -sckx * | sort -nr'
alias 'adventure=emacs -batch -l dunnet'
alias 'mailsize=du -hs ~/Library/mail'
alias 'bk=cd $OLDPWD'
alias 'ttop=top -ocpu -R -F -s 2 -n30'
alias lh='ls -a | egrep "^\."'

#--------------------------------------------------------------------
alias ls='colorls --report --sd'
alias lc='colorls --tree=2'
#--------------------------------------------------------------------

# -------------------------------------------------------------------
# make some commands (potentially) less destructive
# -------------------------------------------------------------------
alias 'rm=rm -i'

# -------------------------------------------------------------------
# Git
# -------------------------------------------------------------------
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'

# leverage an alias from the ~/.gitconfig
alias gh='git hist'

# sort files in current directory by the number of words they contain
alias 'wordy=wc -w * | sort | tail -n10'
alias 'filecount=ls -aRF | wc -l'

# -------------------------------------------------------------------
# Functions ported directly from .bashrc
# -------------------------------------------------------------------
# turn hidden files on/off in Finder
function hiddenOn() { defaults write com.apple.Finder AppleShowAllFiles YES ; }
function hiddenOff() { defaults write com.apple.Finder AppleShowAllFiles NO ; }

# postgres functions
function psqlstart() { /usr/local/pgsql/bin/pg_ctl -D /usr/local/pgsql/data -l logfile start ; }
function psqlstop() { /usr/local/pgsql/bin/pg_ctl stop ; }

# view man pages in Preview
function pman() { ps=`mktemp -t manpageXXXX`.ps ; man -t $@ > "$ps" ; open "$ps" ; }

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# Initialize pyenv on startup
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

eval "$(jump shell)"

# Setup powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1i
. $PYTHON/powerline/bindings/zsh/powerline.zsh
