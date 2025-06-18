# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then        
    . /etc/bashrc 
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then    
    PATH="$HOME/.local/bin:$HOME/bin:$PATH" 
fi 
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

if [ -d ~/.bashrc.d ]; then        
    for rc in ~/.bashrc.d/*; do                
        if [ -f "$rc" ]; then                        
            . "$rc"                
        fi        
    done 
fi
unset rc

#-------------------------------------------------------------------------------------------------------------
# --- Custom configs ---

## --- Set up ---
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(zellij setup --generate-auto-start bash)"
eval "$(starship init bash)"
eval "$(zoxide init bash)"
# eval "$(atuin init bash)"
eval "$(fzf --bash)"

## --- Configs ---
export BAT_THEME="Catppuccin Mocha"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

## --- Aliases ---
alias vim="nvim"
alias cat="bat"
alias lg="lazygit"
alias ld="lazydocker"
alias ff="fastfetch"
alias rm="trash -rdf"
alias cd="z"
alias clear="reset"
alias clr="reset"
alias ls="eza --long --header --icons --git"
alias ll="eza --long --header --icons --git --git-ignore --tree"
alias zl="zellij"
alias fzf="fzf -m --preview='bat --color=always {}'"
alias codef='code $(fzf -m --preview="bat --color=always {}")'
alias reload="source ~/.bashrc"

## --- Functions for containers ---
start_redis() {
    podman run --rm -d -p "127.0.0.1:6378:6379" --name=redis redis:7
}

start_mysql() {
    podman run --rm -d -p "127.0.0.1:3306:3306" --name=mysql -e MYSQL_ROOT_PASSWORD= -e MYSQL_ALLOW_EMPTY_PASSWORD=true mysql:8.4
}

start_postgres(){
    podman run --rm -d -p "127.0.0.1:5432:5432" --name=postgres -e POSTGRES_HOST_AUTH_METHOD=trust postgres:16
}
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
