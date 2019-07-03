if !has("python3")
    echo "vim has to be compiled with +python3 to run this"
    finish
endif

if exists('g:fsub_loaded')
    finish
endif

let g:fsub_loaded = 1

let s:plugin_root_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')
exe 'py3file ' . escape(s:plugin_root_dir, ' ') . '/../python/fsub.py'

" python3 << EOF
" import sys
" from os.path import normpath, join
" import vim
" plugin_root_dir = vim.eval('s:plugin_root_dir')
" python_root_dir = normpath(join(plugin_root_dir, '..', 'python'))
" sys.path.insert(0, python_root_dir)
" import fsub
" EOF

function! FToggle()
    " python3 fsub.fsub_func()
    python3 fsub_func()
endfunction
command! -nargs=0 FToggle call FToggle()
