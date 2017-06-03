#Fail on error
set -e

#Libraries required by a lot of stuff
sudo apt-get install automake libevent-dev libncurses5-dev gnome-tweak-tool libncursesw5-dev dconf-editor git python-dev vim-gnome zsh trash-cli libtool autogen gfortran libreadline-dev -y

#Configure git
git config --global user.name "Sravan Vankina"
git config --global user.email "spvankina@gmail.com"
git config --global push.default current

cd $HOME

#Setup my custom builds
mkdir my_apps
cd my_apps

#Install pip
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py --user
rm get-pip.py

#Install virtualenvwrapper
pip install virtualenvwrapper --user


#Install powerline
pip install --user powerline-status

#Setup NeoBundle
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

#Install tmux
wget https://github.com/tmux/tmux/releases/download/2.5/tmux-2.5.tar.gz
tar -xvf tmux-2.5.tar.gz
cd tmux-2.5
./configure --prefix=$HOME/.local
make && make install
cd ../
rm -rf tmux-*

#Get htop from github, install, and cleanup
git clone https://github.com/hishamhm/htop.git
cd htop
./autogen.sh
./configure --prefix=$HOME/.local
make && make install
cd ../
rm -rf htop

wget https://github.com/powerline/fonts/archive/2015-12-04.tar.gz
tar -xvf 2015-12-04.tar.gz
cd fonts-2015-12-04
./install.sh
cd ..
rm -rf fonts-2015-12-04


cd $HOME

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#Start setting up workspace
mkdir ~/wksp
cd wksp
git clone git@github.com:svankina/dotfiles.git
sh dotfiles/setup.sh

vim +NeoBundleInstall +qall

mv ~/.vim/bundle/xmledit/ftplugin/html.vim ~/.vim/bundle/xmledit/ftplugin/htmlvim_bak
ln -s $HOME/.vim/bundle/xmledit/ftplugin/xml.vim $HOME/.vim/bundle/xmledit/ftplugin/html.vim

