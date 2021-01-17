#!/usr/bin/env sh

CHECK_MARK="\e[32m✔\e[0m"

# update and upgrade
echo "Update system.."
sudo apt update && sudo apt -y upgrade
echo " $CHECK_MARK" && TOTAL_CHECKS=$TOTAL_CHECKS$CHECK_MARK

# install zsh
echo -n "Check if zsh is installed.."
if ! hash zsh 2>/dev/null; then
    echo " installing..."
    # get zsh
    sudo apt install -y zsh
    # get oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
echo " $CHECK_MARK" && TOTAL_CHECKS=$TOTAL_CHECKS$CHECK_MARK

# install neovim
echo -n "Check if neovim is installed.."
if ! hash nvim 2>/dev/null; then
    echo " installing..."
    sudo apt-get install -y neovim
    # get plugin manager
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    # install plugins
    nvim -c "PlugInstall"
fi
echo " $CHECK_MARK" && TOTAL_CHECKS=$TOTAL_CHECKS$CHECK_MARK

# install tmux
echo -n "Check if tmux (rust) is installed.."
if ! hash tmux 2>/dev/null; then
    echo " installing..."
    sudo apt install -y tmux
fi
echo " $CHECK_MARK" && TOTAL_CHECKS=$TOTAL_CHECKS$CHECK_MARK

# install cargo (rust)
echo -n "Check if cargo (rust) is installed.."
if ! hash cargo 2>/dev/null; then
    echo " installing..."
    # get cargo
    curl https://sh.rustup.rs -sSf | sh
fi
echo " $CHECK_MARK" && TOTAL_CHECKS=$TOTAL_CHECKS$CHECK_MARK

# install xclip
echo -n "Check if xclip is installed.."
if ! hash xclip 2>/dev/null; then
    echo " installing..."
    sudo apt install -y xclip
fi
echo " $CHECK_MARK" && TOTAL_CHECKS=$TOTAL_CHECKS$CHECK_MARK

# install exa
echo -n "Check if exa is installed.."
if ! hash exa 2>/dev/null; then
    echo " installing..."
    sudo apt install -y exa
fi
echo " $CHECK_MARK" && TOTAL_CHECKS=$TOTAL_CHECKS$CHECK_MARK

# install dust
echo -n "Check if dust is installed.."
if ! hash dust 2>/dev/null; then
    echo " installing..."
    # get dust
    cargo install du-dust
fi
echo " $CHECK_MARK" && TOTAL_CHECKS=$TOTAL_CHECKS$CHECK_MARK

# install python
echo -n "Check if python is installed.."
if ! hash python3 2>/dev/null; then
    echo " installing..."
    sudo apt install -y software-properties-common
    sudo add-apt-repository ppa:deadsnakes/ppa
    sudo apt update
    sudo apt install -y python3
    sudo apt install -y python3-pip
    sudo apt install -y build-essential libssl-dev libffi-dev python3-dev
    sudo apt install -y python3-venv
fi
echo " $CHECK_MARK" && TOTAL_CHECKS=$TOTAL_CHECKS$CHECK_MARK

echo ""
echo "🌟✨ It's done! $TOTAL_CHECKS"
echo ""
