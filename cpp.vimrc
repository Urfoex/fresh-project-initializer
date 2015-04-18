source ~/projects/fresh-project-initializer/cpp.bundle.vimrc
source ~/projects/fresh-project-initializer/base.vimrc

let g:ycm_confirm_extra_conf = 0
"let g:ycm_global_ycm_extra_conf="~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"

let g:syntastic_auto_loc_list=1
let g:syntastic_cpp_compiler_options='-std=c++11'
let g:syntastic_cpp_no_include_search=1

nnoremap <silent> <F4> :SyntasticCheck<CR>


"""""""""""""""""""
" Custom commands "
"""""""""""""""""""

" Create a new file where the build log will be placed in.
" Reuse the file on future builds.
if !exists(":Build")
	function! BuildIntoBuffer()
		" setlocal autoread
		let tmp_file = fnamemodify("build.log",":p")
		" getcwd() 
		" tempname()
		execute "! echo \"  vim: autoread\" > " . tmp_file
		execute "!ninja -C build >>" . tmp_file
		execute "badd" . tmp_file
		redraw!
	endfunction

	command Build silent call BuildIntoBuffer()
endif
