## Setup to store config files in bare repository

```
git init --bare $HOME/.cfg
```

create alias for git command with appropriate working directory (which would be $HOME) and path to git directory

with the alias we do not need to be in working directory and we can use the created alias in any directory.

config git for the repository to not show untracked files to make it easier to manage.

add remote tracking branch and push

```
config remote add origin <remote url>
config push
```



## Install your dotfiles on a new system, or migrate to this setup




```
echo .cfg >> .gitignore
```


Add a --bare flat if you wish you use a bare repo

```
git clone <remote-git-repo-url> $HOME/.cfg
```


Set up an alias to send Git commands to .cfg, and also set $HOME as the work tree, while storing the Git state at .cfg

For a bare repo, the path to the Git directory is at the top level of the project: $HOME/.cfg/

For a non-bare default repo, the path to the Git directory is inside a .git subdirectory: $HOME/.cfg/.git

```
alias config='/usr/bin/git --git-dir=<path to .cfg’s Git directory> --work-tree=$HOME'
```

Set a local configuration in .cfg to ignore untracked files

```
config config --local status.showUntrackedFiles no
```

Checkout the actual content from your .cfg repository to $HOME

```
config checkout
```


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

#### optional packages in vim

add the package to the ~/.vim/pack/plugins/opt folder

```
:packadd packagename
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


## VIM Reference

#### Quick Fix window (vim 7+)

:copen " Open the quickfix window
:ccl   " Close it
:cw    " Open it if there are "errors", close it otherwise (some people prefer this)
:cn    " Go to the next error in the window
:cp    " Go to the previous error in the window
:cnf   " Go to the first error in the next file
:.cc   " Go to error under cursor (if cursor is in quickfix window)


## References

https://www.atlassian.com/git/tutorials/dotfiles
https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/


