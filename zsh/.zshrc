# Add ghostty-integration for shell themeing/styling
if [ -n "${GHOSTTY_RESOURCES_DIR}" ]; then
    builtin source "${GHOSTTY_RESOURCES_DIR}/shell-integration/zsh/ghostty-integration"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Add nvim and apache maven to path
export PATH="$PATH:/opt/nvim/"
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:/opt/apache-maven-3.9.9"
export PATH="$PATH:/opt/apache-maven-3.9.9/bin"
export PATH="$PATH:/usr/lib/jvm/java-11-openjdk-amd64/bin"
export PATH="$PATH:$HOME/yazi/target/release"

# Set electron hint for Wayland trigger
export ELECTRON_OZONE_PLATFORM_HINT=auto

# Set XDG home dir (default)
export XDG_DATA_HOME="$HOME/.local/share"

# Set .dotfiles folder locations for easy entry
export DOT=$HOME/.dotfiles
export NVIM_CONF=$DOT/nvim/.config/nvim
export ZSH_CONF=$DOT/zsh
export STARSHIP_CONF=$DOT/starship
export GHOSTTY_CONF=$DOT/ghostty/.config/ghostty
export GIT_CONF=$DOT/git

# ZSH plugins
plugins=(
  git
 # zsh-syntax-highlighting
  fast-syntax-highlighting
  zsh-autosuggestions
)

# add plugins to oh-my-zsh
source $ZSH/oh-my-zsh.sh

# zoxide config
eval "$(zoxide init zsh)"

# starship eval
eval "$(starship init zsh)"

# Example aliases
alias zshconfig="vim $ZSH_CONF/.zshrc"
alias ll='ls -alF'
alias cd='z'
# alias cat="batcat"

# AI Sweden vpn
alias aivpn='sudo openfortivpn -c $HOME/.config/aivpn.config'

# Mass upadate
alias update='sudo nala upgrade && sudo nala update && sudo snap refresh && flatpak update'

# Battery monitoring
alias bat_info='upower -i /org/freedesktop/UPower/devices/battery_BAT1'
alias full_bat='busctl call org.stefanhoelzl.frameworkd /battery org.stefanhoelzl.framework.Battery SetChargeLimit y 100 && echo "Battery Limit set to 100"'
alias reset_bat='busctl call org.stefanhoelzl.frameworkd /battery org.stefanhoelzl.framework.Battery SetChargeLimit y 80 && echo "Battery Limit reset at 80%"'

# Wayland support and opening shortcuts
alias codium='flatpak run com.vscodium.codium'
alias code="code --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=auto"

# Custom terminal navigation
alias x="exit"
alias y="yazi"

# Export local bath with bin directory 
export PATH="$PATH:$HOME/.local/bin"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


. "$HOME/.local/share/../bin/env"


export NVM_DIR="$HOME/.nvm"

load-nvm() {
  unset -f nvm node npm pnpm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
}

nvm()   { load-nvm; nvm  "$@"; }
node()  { load-nvm; node "$@"; }
npm()   { load-nvm; npm  "$@"; }
pnpm()  { load-nvm; pnpm "$@"; }

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/home/georg/.bun/_bun" ] && source "/home/georg/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
