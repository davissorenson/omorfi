#!/bin/bash
source $(dirname $0)/omorfi.bash
args=$@
dict=describe

if test x$1 == x-h -o x$1 == x--help ; then
    omorfi_print_usage $0
    omorfi_print_help "Analyses running text using omorfi python interface and VISL CG 3"
    echo "This program uses hfst-apertium-proc and, if found"
    echo "apertium-destxt, otherwise sed"
    exit 0
elif test x$1 == x-V -o x$1 == x--version ; then
    omorfi_print_version $0 0.9
    exit 0
elif test x$1 == x-v -o x$1 == x--verbose ; then
    verbose=verbose
    shift 1
elif test x$1 == x-X -o x$1 == x--all-words ; then
    dict=describe
    omorfi_deprecated_x $1
    shift
elif test x$1 == x-Z -o x$1 == x--mini ; then
    dict=analyse
    shift
fi
cat $@ | omorfi_disambiguate_text $dict

