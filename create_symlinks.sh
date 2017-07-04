#!/bin/bash

for filename in $HOME/Tools/vim-snippets/UltiSnips/*.snippets; do
    pass=true
    for excluded_file in "$HOME/Tools/z-snippets"/*.snippets; do
        if [ "$(basename $excluded_file)" = "$(basename $filename)" ]
        then
            pass=false
            local_file=$excluded_file
        fi
    done
    dest_symlink="$HOME/.vim/UltiSnips/$(basename "$filename")"
    if $pass
    then
        ln -s $filename $dest_symlink
    else
        ln -s $local_file $dest_symlink
        ln -s $filename "$HOME/.vim/UltiSnips/ulti_$(basename "$filename")"
    fi
    unset local_file
done
