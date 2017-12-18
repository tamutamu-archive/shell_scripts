#!/bin/bash

. ../common/common.sh
. ./usage.sh

declare -r target_path=$1

find ${target_path} -maxdepth 1 -mindepth 1 -type d | awk '{res = system("du -shx "$1)}'

