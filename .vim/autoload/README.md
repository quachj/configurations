curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


call plug#begin([PLUGIN_DIR])
Plug <plugin>
call plug#end()
