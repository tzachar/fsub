# fsub
Toggle an 'f' at the beginning of strings in python 3.6+

## Usage

Literal string interpolation (f-strings) in python 3.6+ are awesome. But, its easy to forget adding the 
'f' at the beginning of the string in advance. I always find myself having to go back an adding it after writing the string.

This plugin enables you to easily add / remove this troublesome 'f' with a simple mapping (e.g. `<Leader>fs`). 
Standing on a quoted string (with either ' or ") and pressing `<Leader>fs` will toggle the 'f' at the beginning of the string.

## Requirements:

vim/neovim compiled with +python3

## Installing

Just add to any vim plugin manager. For example, vim-plug:
```
Plug 'tzachar/fsub'
```

Add a mapping for python files:

```
augroup pythonFormat                                                                                                                   
autocmd!                                                                                                                               
  autocmd FileType python nnoremap <Leader>fs :FToggle<Cr>                                                                       
augroup end      
```
