#!/bin/bash
set -euo pipefail

. ../../common/common.sh
. ./usage.sh


case ${1} in
  help|--help|-h)
    usage
    exit 0
  ;;

  --debug|-d)
    set -x
    shift
  ;;

  *)
    # check parameter
    if [ $# -lt 2 ]; then
      usage
      exit 1
    fi
  ;;
esac

### Command parameter.
declare -r _output_path=$1
declare -r _repo_list_file_path=$2


### Main

if [ ! -d ${_output_path} ]; then
  mkdir -p ${_output_path}
fi

pushd ${_output_path} > /dev/null


while read line; do

  account_dir=$(echo ${line} | sed -nr "s#https://github.com/([^\/]*)\/.*#\1#p")


done < ${_repo_list_file_path}
