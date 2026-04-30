# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

export PNPM_HOME="/home/dewaeq/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export AUTONOMOUS_REPO_BASE_DIR='/home/dewaeq/autonomous'
export LCM_DEFAULT_URL=udpm://239.255.76.68:7667?ttl=2

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
export ARCHFLAGS="-arch $(uname -m)"

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Cache Oh My Zsh compiled files
zstyle ':omz:plugin:*' lazy yes
zstyle ':completion:*' rehash true

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
	git
  rust
)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && alias nvm='unalias nvm node npm pnpm; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; nvm $@'

source $ZSH/oh-my-zsh.sh

# defer initialization of slow plugins until after shell is ready
source ~/.zsh/zsh-defer/zsh-defer.plugin.zsh
zsh-defer source $ZSH/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
zsh-defer source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User configuration
alias aut="cd $AUTONOMOUS_REPO_BASE_DIR"
alias s="ugr shell"
alias ugr='/home/dewaeq/autonomous/ugr.sh'

alias cpufreq="watch -n 1 \"cat /proc/cpuinfo | grep -i mhz | grep -o '[0-9]*\.' | sort -nr\""
alias mux=tmuxinator

# config git config
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# ros2 run --prefix "gdb -ex 'break main' -ex run --args" graph_slam graph_slam_node
# colcon --log-base /home/ugr/autonomous/.build/log/ build --build-base /home/ugr/autonomous/.build/build/ --install-base /home/ugr/autonomous/.build/install/ --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_EXPORT_COMPILE_COMMANDS=1 --continue-on-error
#
