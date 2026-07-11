# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "romkatv/powerlevel10k"

# Load and initialise completion system
autoload -Uz compinit
compinit

fastfetch --pipe false

# eza aliases for structured, colored directory listings
alias ls="eza --color=always --long --git --icons=always --no-time --no-user --no-permissions"
alias la="eza --color=always --long --all --git --icons=always"
alias ll="eza --color=always --long --all --git --icons=always --header"
alias tree="eza --color=always --tree --icons=always --level=3"

# Fastfetch shortcut
alias ff="fastfetch"
alias sysinfo="fastfetch --structure Type:Title:Separator:OS:Host:Kernel:Uptime:Packages:Shell:Display:WM:Theme:Icons:Terminal:CPU:GPU:Memory:Swap:Disk:Battery"

# Search through command history interactively and execute the selection
alias fh='eval $(history | fzf +s --tac | sed -E "s/^[[:space:]]*[0-9]+[[:space:]]+//")'

# Interactively switch to any subdirectory from the current location
alias fcd='cd $(find . -maxdepth 3 -type d 2>/dev/null | fzf)'

# Interactively find a file and open it in your default editor
alias fe='$EDITOR $(fzf)'

# Interactive process killer (shows running processes, select to kill)
alias fkill='ps -ef | fzf --query="$1" --multi | awk "{print \$2}" | xargs kill -9'

# Smart Archive Extractor
# Usage: ex file.tar.gz, ex file.zip, ex file.7z
ex () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Quick Compressing Shortcuts
alias mkzip="zip -r archive.zip"
alias mktar="tar -cvzf archive.tar.gz"
alias mk7z="7z a -mx=9 archive.7z" # Uses ultra compression level 9

# Create a directory and immediately enter it
mkcd() {
  if [ -n "$1" ]; then
    mkdir -p "$1" && cd "$1"
  else
    echo "Usage: mkcd <directory_name>"
  fi
}

# Advanced Navigation Quick-Hits
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Take me back to the last directory I was in
alias back="cd -"

alias gs="git status"
alias ga="git add"
alias gaa="git add --all"
alias gc="git commit -m"
alias gp="git push"
alias gl="git pull"

# A clean, color-coded, visual Git tree graph directly in the terminal
alias ggraph="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

# Prompt before overwriting or deleting files (Life savers)
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# Copy with a progress bar (uses rsync natively)
alias cpp="rsync -ah --progress"

# Create a backup copy of a file instantly (e.g., config.conf -> config.conf.bak)
buf() { 
  cp -iv "$1" "$1.bak" 
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


alias i="yay --noconfirm"
alias in="yay -S"
