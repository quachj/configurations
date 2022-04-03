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


## References

https://www.atlassian.com/git/tutorials/dotfiles
https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/

