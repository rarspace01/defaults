sudo apt update && sudo apt install -y htop nload git tmux zsh curl wget libreoffice vlc build-essential
# install oh my zshell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# install power 10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# install rclone
sudo -v ; curl https://rclone.org/install.sh | sudo bash
# install visual studio code
#wget -o code.deb https://code.visualstudio.com/sha/download\?build\=stable\&os\=linux-deb-x64 && sudo dpkg -i code.deb
#install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#install k9s
brew install derailed/k9s/k9s
# aws
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
