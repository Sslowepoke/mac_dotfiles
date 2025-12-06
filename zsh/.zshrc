# some colors shit
autoload -U colors && colors
bindkey -e
PS1="%{$fg[magenta]%}%~%{$fg[red]%} %{$reset_color%}$%b " 

# Enable zsh completions (required for compdef)
autoload -Uz compinit
compinit

# Skim integration
source <(sk --shell zsh)
# source <(fzf --zsh) 


finder() { 
				 open .
}
mkcd() {
				mkdir -p "$1" && cd "$1"
}

zle -N finder
bindkey '^f' finder
normalize() {
  ffmpeg -i "$1" -af loudnorm=I=-14:TP=-1.0:LRA=11 -c:v copy -c:a aac -b:a 192k output.mp4
}
_comp_options+=(globdots)

export PATH="/Users/$USER/.local/share/bob/nvim-bin/:$PATH"
export PATH="/Users/$USER/Library/Python/3.9/bin/:$PATH"
export PATH="$PATH:/opt/homebrew/bin/inkscape"
export PATH="/Users/$USER/.local/bin:$PATH"
export RIPGREP_CONFIG_PATH="/Users/$USER/.config/ripgrep/rgrc"
export EDITOR="nvim"
export MANPAGER="nvim +Man!"
export MAILSYNC_MUTE=1
export HISTIGNORE='exit:cd:ls:bg:fg:history:f:fd:vim'

autoload -U compinit && compinit
autoload -U colors && colors
autoload edit-command-line
zmodload zsh/complist
zle -N edit-command-line
bindkey '^Xe' edit-command-line


# if [ -f '/Users/$USER/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/$USER/google-cloud-sdk/path.zsh.inc'; fi
# if [ -f '/Users/$USER/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/$USER/google-cloud-sdk/completion.zsh.inc'; fi

alias cmake="cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON"
alias venv="source .venv/bin/activate"
alias vim=nvim
alias vi="nvim"
alias im="nvim"
alias nm="neomutt"
alias p="poetry"
alias mb="~/Documents/projects/microbrew/target/debug/microbrew" 
# alias yt="lux" 
# alias dl="lux" 
alias dl-audio="yt-dlp -x --audio-format=\"mp3\"" 
alias ls="ls -C -t -U -A -p --color=auto" 
alias src="source ~/.config/zsh/.zshrc"
# alias phpcs="${GG_API}/lib/vendor/bin/phpcs"
# alias phpmd="${GG_API}/lib/vendor/bin/phpmd"
# alias cd-ew="cd ${GG_EW}" 
# alias cd-w="cd ${GG_WEB}" 
# alias cd-a="cd ${GG_API}"

alias fax="cd /Users/slowepoke/Documents/fax/; vim ."

alias notes="cd /Users/slowepoke/Library/Mobile\ Documents/iCloud\~md\~obsidian/Documents/vault/; vim ."

alias matlab="/Applications/MATLAB_R2025a.app/bin/matlab -nodisplay"
alias pita="ssh pita15@pita15.local"

# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"



# if [ -f '/Users/sf/y/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/sf/y/google-cloud-sdk/path.zsh.inc'; fi
# if [ -f '/Users/sf/y/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/sf/y/google-cloud-sdk/completion.zsh.inc'; fi

if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
    exec tmux new-session -A -s ${USER} >/dev/null 2>&1
fi

# case insensitive completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*' # case insensitive completion
zstyle ':completion:*' menu select # menu style completion
autoload -Uz compinit && compinit
compinit

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
