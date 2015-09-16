
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


Setup vundle:

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim
:PluginInstall
```

Setup YouCompleteMe:

```
sudo apt-get install python-dev cmake
cd ~/.vim/bundle/YouCompleteMe
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
