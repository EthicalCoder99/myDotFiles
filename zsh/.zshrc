zmodload zsh/zprof
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/$USER/.oh-my-zsh"

ZSH_THEME="robbyrussell"
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_UNICODE=true

HISTCONTROL=ignoredups:ignorespace
HIST_STAMPS="dd.mm.yyyy"

plugins=(
	zshfl
  docker-compose
  ubuntu
  z
	git
	history
  # tmux
	zsh-autosuggestions
	zsh-syntax-highlighting
	)


source $ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=243,underline"
ZSH_AUTOSUGGEST_USE_ASYNC="true"

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


# -- ALIAS -------------------------------------------------------------------------------------------------------
alias python="python3"
alias zshconfig="vim ~/.zshrc"
alias lc="colorls"
alias zshsrc="source ~/.zshrc"
alias lua-format="/home/sentinel/.luarocks/lib/luarocks/rocks-5.4/luaformatter/scm-1/bin/lua-format"
alias rng="ranger"

# To get info about the git commits in local repo.
alias gitinfo="git log --oneline | fzf --preview 'git show --name-only {1}'"
# To get info about processess.
alias psinfo="ps axo pid,rss,comm --no-headers | fzf --preview 'ps o args {1}; ps mu {1}'"
# To get info about apt dependencies.
# alias dependinfo="apt-cache search . | fzf --preview 'apt-cache depends {1}'"

# ----------------------------------------------------------------------------------------------------------------


# -- JENV --------------------------------------------------------------------------------------------------------
# Try to find jenv, if it's not on the path
export JENV_ROOT="${JENV_ROOT:=${HOME}/.jenv}"
if ! type jenv > /dev/null && [ -f "${JENV_ROOT}/bin/jenv" ]; then
    export PATH="${JENV_ROOT}/bin:${PATH}"
fi

# # Lazy load jenv
# if type jenv > /dev/null; then
#     export PATH="${JENV_ROOT}/bin:${JENV_ROOT}/shims:${PATH}"
#     function jenv() {
#         unset -f jenv
#         eval "$(command jenv init -)"
#         jenv $@
#     }
# fi

# # lazy loading prevent the JAVA_HOME to be set.
# # we have to load jenv inorder to set JAVA_HOME.

eval "$(jenv init -)"

# ----------------------------------------------------------------------------------------------------------------


# -- FZF ---------------------------------------------------------------------------------------------------------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!{.git,node_modules}/*" 2> /dev/null'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# ----------------------------------------------------------------------------------------------------------------


# -- MINI-CONDA --------------------------------------------------------------------------------------------------
source ~/miniconda3/etc/profile.d/conda.sh
if [[ -z ${CONDA_PREFIX+x} ]]; then
    export PATH="~/miniconda3/bin:$PATH"
fi
# ----------------------------------------------------------------------------------------------------------------


# -- MAVEN -------------------------------------------------------------------------------------------------------
export M2_HOME=/usr/local/apache-maven/apache-maven-3.8.5
export M2=$M2_HOME/bin
export PATH=$M2:$PATH
# ----------------------------------------------------------------------------------------------------------------


# -- NPM ---------------------------------------------------------------------------------------------------------
# Make NPM non-sudo
NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$PATH:$NPM_PACKAGES/bin"

# This is temporary solution while building app using yarn.
# Try to remove this if further node versions solve this issue.
# Only enable this in special case. Because it will hinder other programs.
# export NODE_OPTIONS=--openssl-legacy-provider

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
# ----------------------------------------------------------------------------------------------------------------


# -- COLORLS -----------------------------------------------------------------------------------------------------
# source $(dirname $(gem which colorls))/tab_complete.sh
# ----------------------------------------------------------------------------------------------------------------


# -- DOTFILES REPO -----------------------------------------------------------------------------------------------
export DOTFILES_REPO_PATH="~/gitRepos/MyDotFiles"
# ----------------------------------------------------------------------------------------------------------------


# -- KUBECTL -----------------------------------------------------------------------------------------------------
# source <(kubectl completion zsh)
# ----------------------------------------------------------------------------------------------------------------

# -- COMMITIZEN --------------------------------------------------------------------------------------------------
# Run something, muting output or redirecting it to the debug stream
# depending on the value of _ARC_DEBUG.
# If ARGCOMPLETE_USE_TEMPFILES is set, use tempfiles for IPC.
__python_argcomplete_run() {
    if [[ -z "${ARGCOMPLETE_USE_TEMPFILES-}" ]]; then
        __python_argcomplete_run_inner "$@"
        return
    fi
    local tmpfile="$(mktemp)"
    _ARGCOMPLETE_STDOUT_FILENAME="$tmpfile" __python_argcomplete_run_inner "$@"
    local code=$?
    cat "$tmpfile"
    rm "$tmpfile"
    return $code
}

__python_argcomplete_run_inner() {
    if [[ -z "${_ARC_DEBUG-}" ]]; then
        "$@" 8>&1 9>&2 1>/dev/null 2>&1
    else
        "$@" 8>&1 9>&2 1>&9 2>&1
    fi
}

_python_argcomplete() {
    local IFS=$'\013'
    local SUPPRESS_SPACE=0
    if compopt +o nospace 2> /dev/null; then
        SUPPRESS_SPACE=1
    fi
    COMPREPLY=( $(IFS="$IFS" \
                  COMP_LINE="$COMP_LINE" \
                  COMP_POINT="$COMP_POINT" \
                  COMP_TYPE="$COMP_TYPE" \
                  _ARGCOMPLETE_COMP_WORDBREAKS="$COMP_WORDBREAKS" \
                  _ARGCOMPLETE=1 \
                  _ARGCOMPLETE_SUPPRESS_SPACE=$SUPPRESS_SPACE \
                  __python_argcomplete_run "$1") )
    if [[ $? != 0 ]]; then
        unset COMPREPLY
    elif [[ $SUPPRESS_SPACE == 1 ]] && [[ "${COMPREPLY-}" =~ [=/:]$ ]]; then
        compopt -o nospace
    fi
}
complete -o nospace -o default -o bashdefault -F _python_argcomplete cz
# ----------------------------------------------------------------------------------------------------------------
