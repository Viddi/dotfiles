## Installation

* `ln -s $HOME/Development/dotfiles/gitconfig $HOME/.gitconfig`
* `ln -s $HOME/Development/dotfiles/gitignore_global $HOME/.gitignore_global`
* `ln -s $HOME/Development/dotfiles/vimrc $HOME/.vimrc`
* `ln -s $HOME/Development/dotfiles/zshrc $HOME/.zshrc`
* `ln -s $HOME/Development/dotfiles/tmux.conf $HOME/.tmux.conf`
* `ln -s $HOME/Development/dotfiles/init.vim $HOME/.config/nvim/init.vim`

* Linux Only
  * `ln -s $HOME/Development/dotfiles/config $HOME/.config/terminator/config`
  * `ln -s $HOME/Development/dotfiles/redshift.conf $HOME/.config/redshift.conf`

### NeoVim

* Vim-Plug

```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

* `brew install python3`
* `pip2 install neovim --upgrade`
* `pip3 install neovim --upgrade`
* `brew install neovim`

* Universal ctags
  * `brew tap universal-ctags/universal-ctags`
  * `brew install --HEAD universal-ctags`
