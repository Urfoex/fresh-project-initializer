#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import subprocess

def main():
    # current_dir = os.path.abspath(os.path.curdir)
    current_dir = os.path.dirname(os.path.abspath(__file__))
    nojedi_tag = '.nojedi'
    py_vimrc = os.path.join(current_dir, 'py.vimrc')
    py_vimrc_nojedi = os.path.join(current_dir, 'py.vimrc'+nojedi_tag)
    py_bundle_vimrc = os.path.join(current_dir, 'py.bundle.vimrc')
    py_bundle_vimrc_nojedi = os.path.join(current_dir, 'py.bundle.vimrc'+nojedi_tag)
    with open(py_bundle_vimrc, mode='r') as vimrc:
        with open(py_bundle_vimrc_nojedi, mode='w') as vimrc_nojedi:
            for line in vimrc:
                if line.startswith("Plugin 'davidhalter/jedi-vim'"):
                    line = '" ' + line
                vimrc_nojedi.write(line)

    replace_tag = 'py.bundle.vimrc'
    with open(py_vimrc, mode='r') as vimrc:
        with open(py_vimrc_nojedi, mode='w') as vimrc_nojedi:
            for line in vimrc:
                if replace_tag in line:
                    line = '{1!s}{0!s}{2!s}'.format(replace_tag+nojedi_tag, *line.split(replace_tag))
                vimrc_nojedi.write(line)

    subprocess.Popen(['gvim', '-u', py_vimrc_nojedi])

if __name__ == "__main__":
    main()
