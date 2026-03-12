# .bashrc

# load stata
module load stata/18

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# set 256 color terminal
TERM=xterm-256color

# only show two parent folders
PROMPT_DIRTRIM=2

# emacs alias to ensure no X11 connections
alias emacs='emacs -nw'

# configure ls, grep, and shell prompt
alias ls='ls -lh --file-type'
alias grep='grep -s'

# remove page breaks for man pages, which don't work well in emacs
alias man='man -P cat'

# turn on autospelling fix
shopt -s cdspell

# set emacs terminal - note that the $EMACS variable is deprecated; use $INSIDE_EMACS INSTEAD
if [ -n "$INSIDE_EMACS" ]; then

  # remove PROMPT_COMMAND to fix prompt display within emacs shell to PS1
  PROMPT_COMMAND=

  # set emacs terminal
  TERM=dumb
fi

# repeat for older version of emacs
case "$EMACS" in
    t)
    PROMPT_COMMAND=
    TERM=dumb
esac

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/optnfs/common/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/optnfs/common/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/optnfs/common/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/optnfs/common/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# configure miniconda libraries for use in Stata. $CONDA_PREFIX pulls
# from the current active env, rather than all conda envs, which is too
# restrictive - we want both that and stock miniconda3/lib
export LD_LIBRARY_PATH=${CONDA_PREFIX}/lib:/optnfs/common/miniconda3/lib:$LD_LIBRARY_PATH

PS1="\w $ "
