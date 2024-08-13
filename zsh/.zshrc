unset zle_bracketed_paste

autoload -Uz compinit && compinit

source ~/Dotfiles/zsh/.aliases
source ~/Dotfiles/zsh/.safe-paste
source ~/Dotfiles/zsh/.history
source ~/Dotfiles/zsh/.zsh-git
source ~/Dotfiles/zsh/.zsh-theme
source ~/Dotfiles/zsh/.pomodoro

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Changing/making/removing directory
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

function d () {
  if [[ -n $1 ]]; then
    dirs "$@"
  else
    dirs -v | head -n 10
  fi
}
compdef _dirs d

git_prompt() {
  BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/*\(.*\)/\1/')

  if [ ! -z $BRANCH ]; then
    echo -n "%F{yellow}$BRANCH"

    STATUS=$(git status --short 2> /dev/null)

    if [ ! -z "$STATUS" ]; then
      echo " %F{red}✗"
    fi
  fi
}

#Bullet Train Theme Options
BULLETTRAIN_PROMPT_CHAR="%F{white}%} ➝  "
BULLETTRAIN_DIR_BG=yellow
BULLETTRAIN_DIR_FG=black
BULLETTRAIN_CUSTOM_BG=cyan
BULLETTRAIN_CUSTOM_FG=black
BULLETTRAIN_CUSTOM_MSG=
BULLETTRAIN_PROMPT_ORDER=(
  #time
  custom
  status
  #context
  dir
  virtualenv
  git
)


# New content
# ZSH completion
autoload -Uz compinit
compinit
neofetch

# Add /usr/local/bin to PATH
export PATH="/usr/local/bin:$PATH"

# NVM setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Bun setup
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# Neovim setup
export PATH="$PATH:/opt/nvim-linux64/bin"