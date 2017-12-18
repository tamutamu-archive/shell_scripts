#!/bin/bash
set -euo pipefail

. ../common/common.sh
. ./usage.sh

declare -r _target_path=$1
declare -r _old_time=$2


local:echo_file_path_timestamp(){
  echo $1, $(common:get_file_timestamp $1)
}
export -f local:echo_file_path_timestamp


find ${_target_path} -type f -mtime ${_old_time} | xargs -I{} bash -c "local:echo_file_path_timestamp {}"

