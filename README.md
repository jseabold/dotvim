[More reading](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/)

# Initial setup of the repository

    mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/ftplugin

Install pathogen

    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

Copy in your .vimrc from wherever. You'll need the pathogen specific stuff in it. Best to put it at the top.

    call pathogen#runtime_append_all_bundles()
    call pathogen#helptags()

# Initial setup on a new machine

    git clone http://github.com/jseabold/dotvim.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    cd ~/.vim
    git submodule update --init

# Installing plugins as submodules

    cd ~/.vim
    mkdir ~/.vim/bundle
    git submodule add http://github.com/...

# Upgrading all plugin bundles

    git submodule foreach git pull origin master
