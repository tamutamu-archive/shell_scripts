#!/bin/bash

. ../common/common.sh
. ./usage.sh

declare -r target_path=$1
declare -r old_time=$2


local:echo_file_path_timestamp(){
  echo $1, $(common:get_file_timestamp $1)
}
export -f local:echo_file_path_timestamp


find ${target_path} -type f -mtime ${old_time} | xargs -I{} bash -c "local:echo_file_path_timestamp {}"

