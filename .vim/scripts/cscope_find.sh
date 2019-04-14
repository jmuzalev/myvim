#!/bin/bash

find -iregex '.*\.\(h\|hpp\|c\|cpp\|cu\)$' > .files_for_cscope
cscope -i .files_for_cscope -b
rm .files_for_cscope
