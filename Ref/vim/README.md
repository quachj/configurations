## VIM Plugins


3 Ways to handle vim plugins

#### Using 3rd party plugin managers

using VIM Plugin manages like vundle or vim-plug. Download vundle or vim plug
and install in .vim/autoload to automatically load the tools for plugin management.

add the instructions to download and install plugins in vimrc file. Ex.

```
call plug#begin()
Plug <some vim plugin>
call plug#end()
```

#### Using something to manage the runtime path of plugins like Pathogen

download Pathogen into the autoload vim path and add to the vimrc for example:

```
execute pathogen#infect()
syntax on
filetype plugin indent on
```

the management of the plugin has to be manually managed. for example using git repository.

download the desired plugins into the /.vim/bundle directory

also help tags need to be loaded by changing into the plugin directory and running in VIM :Helptags 


#### Using built in plugin loader in vim version 8 and greater

It works the same as pathogen that you have to download the plugin and manage it yourself.

example:

```
mkdir -p ~/.vim/pack/plugins/start/ 
git clone <the-plugin.git> ~/.vim/pack/plugins/start/the-plugin
```

to update run git pull and to delete just delete the folder.

to install help tags run:

```
:helptags ~/.vim/pack/plugins/start/the-plugin
```

#### Manual Managing with git submodules


store .gitmodule in a repository. Like storing dot config files in a bare git repository. Look at the other README. 

```
mkdir ~/vim_config
cd ~/vim_config
git submodule init
git submodule add <the-plugin.git> ~/.vim/pack/plugins/start/the-plugin
git add .gitmodules ~/.vim/pack/plugins/start/the-plugin
git commit -m "add the plugin for vim"
```

#### updating packages

```
git submodule update --remote --merge
git commit -m "updating the plugin for vim"


#### removing the plugin package

```
git submodule deinit ~/.vim/pack/plugins/start/the-plugin
git rm ~/.vim/pack/plugins/start/the-plugin
rm -Rf .git/modules/vim/pack/plugins/start/the-plugin
git commit -m "removing plugin"
```
```
