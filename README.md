### Adding a package

Here is an example of how to add a package using Vim’s native approach to packages and git submodules.

```sh
cd ~/dotfiles
git submodule init
git submodule add https://github.com/vim-airline/vim-airline.git vim/pack/shapeshed/start/vim-airline
git add .gitmodules vim/pack/shapeshed/start/vim-airline
git commit
```

### Updating packages

To update packages is also just a case of updating git submodules.

```sh
git submodule update --init --remote --merge
git commit
```

### Removing a package

Removing a package is just a case of removing the git submodule.

```sh
git submodule deinit vim/pack/shapeshed/start/vim-airline
git rm vim/pack/shapeshed/start/vim-airline
rm -Rf .git/modules/vim/pack/shapeshed/start/vim-airline
git commit
```

```sh
To remove a submodule you need to:

Delete the relevant section from the .gitmodules file.
Stage the .gitmodules changes git add .gitmodules
Delete the relevant section from .git/config.
Run git rm --cached path_to_submodule (no trailing slash).
Run rm -rf .git/modules/path_to_submodule (no trailing slash).
Commit git commit -m "Removed submodule "
Delete the now untracked submodule files rm -rf path_to_submodule
```


### Include `opt` packages

```sh
:packadd packagename
```

### Install plugin 

```sh
env PACK_ENV=common PACK_ACTION=opt make plugin-add ARGS=https://github.com/dracula/dracula-theme
```

#### @TODO

```sh
coc.vim
    - node >= 12.0.0
    - npm install

```
