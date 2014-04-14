#!/bin/bash
# adapted from sontek/dotfiles

base_dir=${PWD}

function link_file {
    source="${base_dir}/$1"
    target="${HOME}/${1//_/.}"
    if [ -d "$i" ] ; then
        if [ ! -e "${target}" ] ; then
            mkdir ${target}
        fi
        for i in ${1}/*
        do
            if [ -e "$i" ] ; then
                link_file "$i"
            fi
        done
    else
        echo "LINKING ${source} -> ${target}"
        if [ -L "${target}" ] ; then
            unlink "$target"
        fi

        if [ -e "${target}" ] && [ ! -L "${target}" ] ; then
            mv "$target" "$target.df.bak"
        fi
        ln -sf "${source}" "${target}"
    fi
}

function unlink_file {
    source="${base_dir}/$1"
    target="${HOME}/${1//_/.}"
    if [ -e "${target}.df.bak" ] && [ -L "${target}" ]; then
        unlink "${target}"
        mv "$target.df.bak" "$target"
    fi
}

if [ "$1" = "restore" ]; then
    for i in _*
    do
        unlink_file "$i"
    done
    exit
else
    for i in _*
    do
        link_file "$i"
    done
fi
