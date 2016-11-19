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
    ...


## Packages not on github

    bash bin/install.sh

# Initial setup on a new machine


    cd ~/
    apt-get install exuberant-ctags ca-certificates unzip
    export CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
    git clone http://github.com/jseabold/dotvim.git ~/.vim
    cd ~/.vim
    mkdir autoload
    mkdir bundle
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    git submodule init
    bash bin/install.sh  # type :so % and :q to install the vba thing
    bash bin/link.sh

# Upgrading all plugin bundles

    git submodule foreach git pull origin master

# Resources

* https://danielmiessler.com/study/vim/
* http://statico.github.io/vim.html
* http://statico.github.io/vim2.html
* http://dougblack.io/words/a-good-vimrc.html
