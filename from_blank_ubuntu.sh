#Fail on error
set -e

#Libraries required by a lot of stuff
sudo apt-get install automake libevent-dev libncurses5-dev gnome-tweak-tool libncursesw5-dev dconf-editor git python-dev vim-gnome zsh trash-cli libtool autogen gfortran liblaplack-dev -y

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
sudo python get-pip.py
rm get-pip.py

#Install virtualenvwrapper
sudo pip install virtualenvwrapper

sudo chown -R svankina $HOME/.cache/pip

#Install powerline
pip install --user powerline-status

#Setup NeoBundle
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
sh install.sh
rm install.sh

#Install tmux
wget https://github.com/tmux/tmux/releases/download/2.0/tmux-2.0.tar.gz
tar -xvf tmux-2.0.tar.gz
cd tmux-2.0
./configure --prefix=$HOME/.local
make && make install
cd ../
rm -rf tmux-*

#Get htop from github, install, and cleanup
git clone https://github.com/hishamhm/htop.git
cd htop
./autogen.sh
./configure --prefix=/home/svankina/.local
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

mv $HOME/.bashrc $HOME/bashrc_backup
#Start setting up workspace
mkdir ~/wksp
cd wksp
git clone git@github.com:svankina/dotfiles.git
sh dotfiles/setup.sh

vim +NeoBundleInstall +qall

mv ~/.vim/bundle/xmledit/ftplugin/html.vim ~/.vim/bundle/xmledit/ftplugin/htmlvim_bak
ln -s /home/svankina/.vim/bundle/xmledit/ftplugin/xml.vim /home/svankina/.vim/bundle/xmledit/ftplugin/html.vim

#sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
