#Fail on error
set -e

mkdir -p ~/.vim/backup


#Libraries required by a lot of stuff
sudo apt-get install automake libevent-dev libncurses5-dev gnome-tweak-tool libncursesw5-dev dconf-editor git python-dev vim-gnome zsh trash-cli libtool autogen gfortran libreadline-dev i3 curl python3-dev cmake direnv xsel-y

#Configure git
git config --global user.name "Sravan Vankina"
git config --global user.email "spvankina@gmail.com"
git config --global push.default current

ssh-keygen -t rsa -b 4096 -C "spvankina@gmail.com"

cd $HOME

#Setup my custom builds
mkdir tmp
cd tmp

#Install pip
wget https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py --user
rm get-pip.py

#Install virtualenvwrapper
#pip install virtualenvwrapper --user

#Install powerline
pip install --user powerline-status

#Setup Vim-Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..
rm -rf fonts


cd $HOME

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#Start setting up workspace
mkdir ~/src
cd src
git clone git@github.com:svankina/dotfiles.git
sh dotfiles/setup.sh

vim +PlugInstall +qall
cd ~/.vim/plugged/YouCompleteMe
./install.py --clang-completer gcc

sudo sh -c 'printf "[SeatDefaults]\nallow-guest=false\n" > /etc/lightdm/lightdm.conf.d/50-no-guest.conf'
