zmodload zsh/zprof
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/sentinel/.oh-my-zsh"
export NVM_LAZY_LOAD=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('vim')
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    zshfl
    evalcache
    zsh-nvm
    git
    history
    tmux
    zsh-autosuggestions
    zsh-syntax-highlighting
    )

. /home/sentinel/.oh-my-zsh/custom/plugins/z-jump/z.sh
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=243,underline"
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# export PATH="$HOME/.jenv/bin:$PATH"
# _evalcache jenv init -
# eval "$(jenv init -)"

# Try to find jenv, if it's not on the path
export JENV_ROOT="${JENV_ROOT:=${HOME}/.jenv}"
if ! type jenv > /dev/null && [ -f "${JENV_ROOT}/bin/jenv" ]; then
    export PATH="${JENV_ROOT}/bin:${PATH}"
fi

# Lazy load jenv
if type jenv > /dev/null; then
    export PATH="${JENV_ROOT}/bin:${JENV_ROOT}/shims:${PATH}"
    function jenv() {
        unset -f jenv
        eval "$(command jenv init -)"
        jenv $@
    }
fi




alias zshconfig="vim ~/.zshrc"
alias zshsource="source ~/.zshrc"
alias python="python3"
alias pip="pip3"
alias vimconfig="vim ~/.config/nvim/init.vim"
alias nnvim="nv.sh"

source /usr/share/doc/fzf/examples/key-bindings.zsh

source /usr/share/doc/fzf/examples/completion.zsh

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!{.git,node_modules}/*" 2> /dev/null'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# To get info about the git commits in local repo.
alias gitinfo="git log --oneline | fzf --preview 'git show --name-only {1}'"
# To get info about processess.
alias psinfo="ps axo pid,rss,comm --no-headers | fzf --preview 'ps o args {1}; ps mu {1}'"
# To get info about apt dependencies.
# alias dependinfo="apt-cache search . | fzf --preview 'apt-cache depends {1}'"


# Common conventions to make user defined fuctions:
# 1. Always make a .zshfn dir if not exist in ~/ .
# 2. Add file with the name of fuction you want to define.
# 3. File should be extensionless.(eg. clicolors)
# 4. Paste below lines to load the files.

# To load user define funtions into zsh.
# fpath=( ~/.zshfn "${fpath[@]}" )
# For now only load clicolors.
# timezsh takes too much time while sourcing.
# autoload -Uz clicolors

# For loading all the function in the file name ~/.zshfn
# This should be preferred.
# autoload -Uz $fpath[1]/*(.:t)
