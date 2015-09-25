cd ~/src/
git clone https://github.com/vim/vim
cd vim

export LDFLAGS=-L${HOME}/.miniconda/lib
./configure --with-features=huge --enable-perlinterp --enable-rubyinterp --enable-cscope --enable-gui=auto --enable-multibyte --enable-python3interp=dynamic --with-python3-config-dir=~/.miniconda/lib/python3.4/config-3.4m

# then add the miniconda lib path to ld_library_path since we linked dynamically
