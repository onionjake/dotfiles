
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
