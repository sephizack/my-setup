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

# Git Aliases
alias gpl="git pull"
alias gplo="git pull origin"
alias gplsub="git submodule update --recursive --remote"
alias gpu="git push"
alias gs="git --no-pager status"
alias gsu="git --no-pager status -uno"
alias gl="git log --decorate --graph --pretty"
alias gca="git add -u && git commit"
alias gch="git checkout"
alias gdf="git diff"
alias gcl="git clone --recursive"
alias gba="git --no-pager branch"
alias gbaa="git --no-pager branch -a"
alias gsubmodulereset="git submodule deinit --all -f && git submodule update --init --recursive"
alias gcamend="git add -u && git commit --amend"
function gforksync() {
    git remote -v | grep fetch | head -1 | python3 -c '\
import sys; \
repo_path = sys.stdin.read().strip().split("/")[-2:]; \
repo_path[-1] = repo_path[-1].split(".git")[0]; \
print("Open URL: https://rndwww.nce.amadeus.net/git/plugins/servlet/sync/"+"/".join(repo_path)) \
'
}

alias ll="ls -G -a -l"
alias ..="cd .."
function cdtmp() {
    tdir=$( mktemp -d )
    cd "$tdir"
    echo "Moved to temp dir $tdir"
}

# Need a tweak in arch for home and end keys to work properly
# (as well as insert, delete, pageup, pagedown, perhaps others...)
# https://wiki.archlinux.org/index.php/Home_and_End_keys_not_working#Zsh
bindkey "^[[2~" overwrite-mode # Ins
bindkey "^[[3~" delete-char # Del
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

