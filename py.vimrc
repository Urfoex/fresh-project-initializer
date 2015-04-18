source ~/projects/fresh-project-initializer/py.bundle.vimrc
source ~/projects/fresh-project-initializer/base.vimrc

let g:pymode = 1
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_lint_checkers = ['pylint', 'pep8', 'mccabe', 'pep257', 'pyflakes']
let g:pymode_lint_on_write = 0
let g:pymode_lint_on_fly = 0
let g:pymode_folding = 0
let g:pymode_options = 0
let g:pymode_options_max_line_length = 120
let g:pymode_run = 0
let g:pymode_syntax = 1
let g:pymode_syntax_slow_sync = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_print_as_function = 1

" g:pymode_options "
set complete+=t
set formatoptions-=t
set number
set wrap
set textwidth=120
