sudo apt update && sudo apt install -y htop nload git tmux zsh curl wget libreoffice vlc build-essential flatpak ca-certificates gnupg
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
# install oh my zshell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# install power 10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
wget -o font1.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget -o font2.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget -o font3.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget -o font4.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
sudo cp ~/*.ttf /usr/share/fonts
sudo fc-cache -f -v
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

# emote
flatpak install com.tomjwatson.Emote

#install sdkman for jdk
curl -s "https://get.sdkman.io" | bash
sdk install java 21.0.1-tem
