#!/bin/sh

baseDir="$(cd "$(dirname $0)" ; pwd -P)"
dotFiles="bash_profile bin gitignore_global gvimrc tmux.conf vim vimrc ssh"
colorErr="\033[31m"
colorNone="\033[m"

unset fileExists
for fn in ${dotFiles}; do
    # A target file already exists
    if [ -f ~/.${fn} -a ! -L ~/.${fn} ]; then
        echo "File ~/.${fn} exists"
        fileExists=1
    fi
    # A target symbolic link already exists and points to elsewhere
    if [ -L ~/.${fn} -a "`readlink ~/.${fn}`" != "${baseDir}/${fn}" ]; then
        echo "Symbolic link ~/.${fn} points to a different location"
        fileExists=1
    fi
done

if [ ${fileExists} ]; then
    echo ${colorErr}Please remove files above and try again${colorNone}
    exit
else
    # Create symbolic links
    for fn in ${dotFiles}; do
        ln -sfh ${baseDir}/${fn} ~/.${fn}
    done
fi

source ~/.bash_profile

#----------------------------------------------------------------------
# For vim
#----------------------------------------------------------------------

# get vim plugins
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    mkdir -p ~/.vim/bundle
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall

# Build ycm
echo
read -p "Do you want to build YouCompleteMe for vim? [Y/n] " yn
case $yn in 
    [Nn]* ) 
        break
        ;;
    * )
        cd ~/.vim/bundle/YouCompleteMe
        ./install.sh --clang-completer
        break
        ;;
esac

# Build command-t: ruby18 required
echo
read -p "Do you want to build Command-T (ruby required) for vim? [Y/n] " yn
case $yn in 
    [Nn]* )
        break
        ;;
    * )
        cd ~/.vim/bundle/Command-T/ruby/command-t
        ruby extconf.rb && make
        break
        ;;
esac
