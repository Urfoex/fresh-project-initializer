#!/bin/sh

vim_folder=~/.vim
vimrc_file=~/.vimrc

py_vim_folder=./py.vim
py_vimrc_file=./py.vimrc

cpp_vim_folder=./cpp.vim
cpp_vimrc_file=./cpp.vimrc

current_path=`pwd`
home_path=~

readlink_vim_folder=`readlink -f $vim_folder`
readlink_vimrc_file=`readlink -f $vimrc_file`

readlink_py_vim_folder=`readlink -f $py_vim_folder`
readlink_py_vimrc_file=`readlink -f $py_vimrc_file`

readlink_cpp_vim_folder=`readlink -f $cpp_vim_folder`
readlink_cpp_vimrc_file=`readlink -f $cpp_vimrc_file`


if [ "$readlink_vimrc_file" = "$readlink_py_vimrc_file" -a "$readlink_vim_folder" = "$readlink_py_vim_folder" ]
then
    echo "[VIMRC] is PY"
    echo "[VIMRC] changing to CPP..."
    ln -fsnv $current_path/$cpp_vimrc_file $home_path/.vimrc
    ln -fsnv $current_path/$cpp_vim_folder $home_path/.vim
    echo "[VIMRC] is CPP"
elif [ "$readlink_vimrc_file" = "$readlink_cpp_vimrc_file" -a "$readlink_vim_folder" = "$readlink_cpp_vim_folder" ]
then
    echo "[VIMRC] is CPP"
    echo "[VIMRC] changing to PY..."
    ln -fsnv $current_path/$py_vimrc_file $home_path/.vimrc
    ln -fsnv $current_path/$py_vim_folder $home_path/.vim
    echo "[VIMRC] is PY"
else
    echo "[VIMRC] is strange $readlink_vimrc_file"
    echo "[VIMRC] is strange $readlink_vim_folder"
fi
