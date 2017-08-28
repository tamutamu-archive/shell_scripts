#!/bin/bash

. ../common/common.sh
. ./usage.sh

declare -r process_name=$1

grep_word="["`echo ${process_name} | cut -c 1`"]"`echo ${process_name} | cut -c 2-`

ps aux \
  | grep "${grep_word}" | grep -v $0 \
  | awk '{totalMem += $6} END {print totalMem/1024" MB"}'
