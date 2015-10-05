# C.vim

cd ~/.vim
curl http://www.vim.org/scripts/download_script.php?src_id=9679 -o cvim.zip
unzip cvim.zip
rm cvim.zip

# SQLUtilities

cd ~/.vim
curl http://www.vim.org/scripts/download_script.php?src_id=19633 -o align.vba.gz 
vim align.vba.gz
# in vim
# :so %
# :q
# these mappings are annoying, so only keep them for sql files
mv autoload/Align.vim ftplugin/sql_Align.vim
mv autoload/AlignMaps.vim ftplugin/sql_AlignMaps.vim

curl -o sqlutil.zip http://www.vim.org/scripts/download_script.php?src_id=19113
unzip sqlutil.zip
rm sqlutil.zip

cd ~/.vim
