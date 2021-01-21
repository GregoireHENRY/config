#!/usr/bin/env bash
set -e

# print a check mark after a success
check() {
    echo " $CHECK_MARK"
}

# assume every file in simple/ or complete/ are named the same as those on your PC from $HOME
backup_and_move() {
    cp $HOME/$1 $TMP_BACKUP
    cp $INSTALLATION_MODE/$1 $HOME/$1
    echo "$(tput setaf 7)$HOME/$(tput sgr0)$(tput setaf 6)$1$(tput sgr0) moved to $(tput setaf 3)$TMP_BACKUP$(tput sgr0) and $(tput setaf 7)$INSTALLATION_MODE/$(tput sgr0)$(tput setaf 6)$1$(tput sgr0) copied instead."
}

# variables
TMP_BACKUP="/tmp/greg-config/"
CHECK_MARK="$(tput bold; tput setaf 2)✔$(tput sgr0)"

# CLI
OPTIONS=sc
LONGOPTS=release,test
! PARSED=$(getopt --options=$OPTIONS --longoptions=$LONGOPTS --name "$0" -- "$@")
eval set -- "$PARSED"
s=n c=n
while true; do
    case "$1" in
        -s|--simple) s=y; shift;;
        -c|--copy) c=y; shift;;
        --) shift; break;;
        *) echo "Argument error"; exit 3;;
    esac
done

[[ $s == n ]] && INSTALLATION_MODE="complete" || INSTALLATION_MODE="simple"

echo ""
echo "🚚 Installation of the $(tput bold; tput setaf 7)$INSTALLATION_MODE$(tput sgr0) mode started."
[[ $c == y ]] && echo "$(tput dim)The mode 'copy & replace' is set $(tput sgr0; tput setaf 1)ON$(tput sgr0; tput dim).$(tput sgr0)"
echo ""

# update and upgrade
echo "$(tput smul)Update system$(tput sgr0)"
sudo apt update && sudo apt -y upgrade
check

# build essential
echo "$(tput smul)Check essential build$(tput sgr0)"
sudo apt install build-essential
check

# install zsh
echo -n "$(tput smul)Check if zsh is installed$(tput sgr0)"
if [ ! hash zsh 2>/dev/null ]; then
    echo " installing..."
    # get zsh
    sudo apt install -y zsh
    # get oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y
    # make zsh default shell
    chsh -s $(which zsh)
fi
check

# install neovim
echo -n "$(tput smul)Check if neovim is installed$(tput sgr0)"
if [ ! hash nvim 2>/dev/null ]; then
    echo " installing..."
    sudo apt-get install -y neovim
    # get plugin manager
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    # install plugins
    nvim -c "PlugInstall"
fi
check

# install tmux
echo -n "$(tput smul)Check if tmux is installed$(tput sgr0)"
if [ ! hash tmux 2>/dev/null ]; then
    echo " installing..."
    sudo apt install -y tmux
fi
check

# install cargo (rust)
echo -n "$(tput smul)Check if cargo (rust) is installed$(tput sgr0)"
if [ ! hash cargo 2>/dev/null ]; then
    echo " installing..."
    # get cargo
    curl https://sh.rustup.rs -sSf | sh
fi
check

# install xclip
echo -n "$(tput smul)Check if xclip is installed$(tput sgr0)"
if [ ! hash xclip 2>/dev/null ]; then
    echo " installing..."
    sudo apt install -y xclip
fi
check

# install exa
echo -n "$(tput smul)Check if exa is installed$(tput sgr0)"
if [ ! hash exa 2>/dev/null ]; then
    echo " installing..."
    sudo apt install -y exa
fi
check

# install dust
echo -n "$(tput smul)Check if dust is installed$(tput sgr0)"
if [ ! hash dust 2>/dev/null ]; then
    echo " installing..."
    # get dust
    cargo install du-dust
fi
check

# install python
echo -n "$(tput smul)Check if python is installed$(tput sgr0)"
if [ ! hash python3 2>/dev/null ]; then
    echo " installing..."
    sudo apt install -y software-properties-common
    sudo add-apt-repository ppa:deadsnakes/ppa
    sudo apt update
    sudo apt install -y python3
    sudo apt install -y python3-pip
    sudo apt install -y build-essential libssl-dev libffi-dev python3-dev
    sudo apt install -y python3-venv
fi
check

echo ""
echo "🌟✨ Installation completed!"
echo ""

if [[ $c == n ]]; then
    echo -n "To you want to replace your configurations files by thoese in $(tput bold; tput setaf 7)$INSTALLATION_MODE$(tput sgr0) (y/N)? "
    old_stty_cfg=$(stty -g)
    stty raw -echo ; answer=$(head -c 1) ; stty $old_stty_cfg # Careful playing with stty
    if echo "$answer" | grep -iq "^y" ;then
        c=y
        echo "y"
    else
        echo "n"
        echo ""
        echo "Well, see yourself what config file you want to move from the $(tput bold; tput setaf 7)$INSTALLATION_MODE$(tput sgr0) folder:"
        tree -a --dirsfirst $INSTALLATION_MODE
        exit 0;
    fi
fi

# copy config
mkdir -p $TMP_BACKUP
backup_and_move ".zshrc"
backup_and_move ".tmux.conf"
backup_and_move ".gitconfig"
backup_and_move ".oh-my-zsh/themes/greghenry.zsh-theme"
backup_and_move ".config/aliases"
backup_and_move ".config/startup"
backup_and_move ".config/nvim/init.vim"
backup_and_move ".config/nvim/tmuxify_command.sh"
backup_and_move ".config/nvim/tmuxify_command.vim"
backup_and_move ".config/nvim/coc-settings.json"
backup_and_move ".config/nvim/colors/iceberg.vim"

echo ""
echo "🌟✨ Files copied successfully and backups created at $(tput setaf 3)$TMP_BACKUP$(tput sgr0)!"
echo ""
