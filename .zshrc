setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS
#setopt SHARE_HISTORY
setopt APPEND_HISTORY
unsetopt CORRECT_ALL
unsetopt REC_EXACT
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
autoload -U promptinit
promptinit
prompt adam2
unsetopt correct_all

alias editrc="vim ~/.zshrc && source ~/.zshrc"
alias srcrc="source ~/.zshrc"
alias gpl="git pull"
alias gplo="git pull origin"
alias gpu="git push"
alias gs="git status"
alias gsu="git status -uno"
alias gl="git log --decorate --graph --pretty"
alias gca="git commit -am"
alias gch="git checkout"
alias gdf="git diff"
alias gcl="git clone --recursive"
alias gba="git branch -a"
alias gcamend="git commit -a --amend"

alias ll="ls -G -a -l"
alias ..="cd .."

# Need a tweak in arch for home and end keys to work properly
# (as well as insert, delete, pageup, pagedown, perhaps others...)
# https://wiki.archlinux.org/index.php/Home_and_End_keys_not_working#Zsh
bindkey "^[[2~" overwrite-mode # Ins
bindkey "^[[3~" delete-char # Del
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

