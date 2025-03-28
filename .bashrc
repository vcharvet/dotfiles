# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac
# custom TERM
#export TERM=xterm-color


# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

#custom color prompt
PS1='\[\033[1;33m\]\u\[\033[1;94m\]@\[\033[1;92m\]\h\[\033[1;94m\]:\[\033[1;95m\]\W\[\033[1;94m\]\$\[\033[1;37m\] ' # change to \w to get full path 

#export PS1="\[\e[32m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\[\e[32m\]]\[\e[m\]\[\e[32;47m\]\\$"

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -lh'
alias la='ls -lhA'
alias l='ls -a'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# custom aliases
alias gs='git status'
alias pythond='python -m ipdb'
#alias atom='atom . &'


# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
	    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
	            source  "$BASE16_SHELL/profile_helper.sh"
base16_google-dark  # base16_material-palenight for ssh

# Exporting spark home dir
# simlink to /opt/spark for future upgrades
#export SPARK_HOME="/opt/spark"
#export HADOOP_HOME="/opt/hadoop"
#export HADOOP_CONF_DIR="$HADOOP_HOME/etc/hadoop"

#export JAVA_OPTS="-Xmx4g"

#export PATH="$SPARK_HOME"/bin:$PATH

# Anaconda path
#ANACONDA_HOME="$HOME/anaconda3"

#export PATH="$ANACONDA_HOME"/bin:$PATH


# Default Bokeh browser
BOKEH_BROWSER="Chromium('chromium')"   



# CUDA PATHs
CUDA_HOME="/usr/local/cuda/"
export CUDA_VISIBLE_DEVICES="0"
export CUDA_LAUNCH_BLOCKING=1

export PATH="$CUDA_HOME"/bin:$PATH
export PATH="$CUDA_HOME"/NsightCompute-2019.1:$PATH
export LD_LIBRARY_PATH="$CUDA_HOME"lib64   #:$LD_LIBRARY_PATH

#export JAVA_HOME='/usr/lib/jvm/default-java'

# Sumo home
export SUMO_HOME="/opt/sumo" # "/usr/share/sumo"
export PATH="$SUMO_HOME/bin:$PATH"
# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"


# mujoco
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/valentin/.mujoco/mujoco210/bin
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/valentin/.mujoco/mujoco200/bin



# datasets
export DATA_PATH="$HOME/workspace/datasets"
export PATH=$PATH:/home/val-ubuntu/bin
