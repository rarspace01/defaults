sudo apt update && sudo apt install htop nload git tmux zsh curl wget
# install oh my zshell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# install power 10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# install rclone
sudo -v ; curl https://rclone.org/install.sh | sudo bash

