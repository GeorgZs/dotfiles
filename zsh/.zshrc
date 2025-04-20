# Add ghostty-integration for shell themeing/styling
if [ -n "${GHOSTTY_RESOURCES_DIR}" ]; then
    builtin source "${GHOSTTY_RESOURCES_DIR}/shell-integration/zsh/ghostty-integration"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Add nvim and apache maven to path
export PATH="$PATH:/opt/nvim/"
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:/opt/apache-maven-3.9.9"
export PATH="$PATH:/opt/apache-maven-3.9.9/bin"

# Set electron hint for Wayland trigger
export ELECTRON_OZONE_PLATFORM_HINT=auto

# Set XDG home dir (default)
export XDG_DATA_HOME="$HOME/.local/share"

# Set .dotfiles folder location
export DOT=$HOME/.dotfiles

# ZSH plugins
plugins=(
  git
  zsh-syntax-highlighting
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
alias zshconfig="vim ~/.zshrc"
alias ll='ls -alF'
alias cd='z'

# AI Sweden vpn
alias aivpn='sudo openfortivpn -c $HOME/.config/aivpn.config'

# Mass upadate
alias update='sudo nala upgrade && sudo nala update && sudo snap refresh && flatpak update'

# Battery monitoring
alias bat_info='upower -i /org/freedesktop/UPower/devices/battery_BAT1'
alias full_bat='busctl call org.stefanhoelzl.frameworkd /battery org.stefanhoelzl.framework.Battery SetChargeLimit y 100'
alias reset_bat='busctl call org.stefanhoelzl.frameworkd /battery org.stefanhoelzl.framework.Battery SetChargeLimit y 80'

# Wayland support and opening shortcuts
alias codium='flatpak run com.vscodium.codium'
alias code="code --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=auto"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# 
export PATH="$PATH:$HOME/.local/bin"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end




