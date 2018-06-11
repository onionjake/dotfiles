
Put git author stuff in `~/.gitauthor`
```
[user]
	email = my@email.com
	name = myname
```

Put custom vim settings in `~/.vimrc.custom`

```
" Change tab stop for a directory
autocmd BufRead,BufNewFile /some/source/dir/* setlocal ts=4 sw=4
" always load this tag file
set tags+=/source/dir/tags
" Don't prompt if it is okay to load this file
let g:ycm_extra_conf_globlist = ['~/source/dir/.ycm_extra_conf.py']
```


Setup vim-plug:

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim
:PlugInstall
```

Setup YouCompleteMe:

```
sudo apt-get install python-dev cmake
cd ~/.vim/plugged/YouCompleteMe
./install.py --clang-completer --gocode-completer
```

Install powerline fonts:

```
git clone --depth 1 https://github.com/powerline/fonts.git
cd fonts
./install.sh
```

Pick the font in Edit -> Profile Preferences -> Custom font -> Ubuntu Mono derivative Powerline Regular

Install go utilities:

```
:GoInstallBinaries
```

Generate gotags:

```
cd ~/dir/to/go/code && ~/.gostuff/bin/gotags -R `pwd` > ~/.vim/gotags
# add to .vimrc.custom: tags+=~/.vim/gotags 
```

Install xclip:

```
sudo apt-get install xclip vim-gtk
```

Install shellcheck:
```
sudo apt install shellcheck
```
