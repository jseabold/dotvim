[More reading](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/)

# Initial setup of the repository

    mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/ftplugin

Install pathogen

    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

Copy in your .vimrc from wherever. You'll need the pathogen specific stuff in it. Best to put it at the top.

    call pathogen#inspect()
    call pathogen#helptags()

# Add packages

    git submodule add https://github.com/tpope/vim-sensible.git bundle/vim-sensible
    git submodule add https://github.com/hallison/vim-markdown.git bundle/vim-markdown
    git submodule add https://github.com/tpope/vim-fugitive.git bundle/vim-fugitive
    git submodule add https://github.com/rkulla/pydiction.git bundle/pydiction
    git submodule add https://github.com/nvie/vim-flake8 bundle/vim-flake8
    git submodule add https://github.com/scrooloose/syntastic bundle/syntastic
    git submodule add https://github.com/hynek/vim-python-pep8-indent.git bundle/vim-python-pep8-indent
    git submodule add https://github.com/tell-k/vim-autopep8 bundle/vim-autopep8
    git submodule add https://github.com/emnh/taglist.vim bundle/taglist
    git submodule add https://github.com/kchmck/vim-coffee-script bundle/vim-coffee-script
    git submodule add https://github.com/derekwyatt/vim-scala bundle/vim-scala
    git submodule add https://github.com/tpope/vim-rsi.git bundle/vim-rsi
    git submodule add https://github.com/tpope/vim-jdaddy.git bundle/vim-jdaddy
    git submodule add https://github.com/tpope/vim-surround.git bundle/vim-surround
    git submodule add https://github.com/tpope/vim-commentary.git bundle/vim-commentary
    git submodule add https://github.com/bling/vim-airline bundle/vim-airline
    git submodule add https://github.com/terryma/vim-expand-region bundle/vim-expand-region
    git submodule add https://github.com/altercation/vim-colors-solarized bundle/vim-colors-solarized

## Packages not on git

    bash bin/install.sh

# Initial setup on a new machine

    git clone http://github.com/jseabold/dotvim.git ~/.vim
    cd ~/.vim
    bash bin/link.sh

# Installing plugins as submodules

    cd ~/.vim
    mkdir ~/.vim/bundle
    git submodule add http://github.com/...

# Upgrading all plugin bundles

    git submodule foreach git pull origin master
