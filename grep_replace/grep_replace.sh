#!/bin/bash

. ../common/common.sh
. ./usage.sh


result=($(find ${target_path} -type d -name ".git" -prune -o -name "${name_ptn}" -type f -print))


display_all(){
  
  for file in "$@";
  do
    grep --color=always -H -P ${grep_ptn} ${file}
  done
}

replace_all(){

  if ${DRY_RUN}; then
    awk_opt=''
  else
    awk_opt='-i inplace'
  fi

  for file in "$@";
  do
    awk ${awk_opt} -v "src_ptn=${grep_ptn}" -v "rep_word=${replace_word}" '
      BEGIN{}

      {
        gsub(src_ptn, rep_word, $0);
        print $0;
      }

      END{}

    ' ${file}
  done
}


if ${REPLACE_MODE}; then

  if [ "${PRE_BACKUP}" == "true" -a "${DRY_RUN}" == "false" ] ; then
    tmpdir=$(mktemp -d --suffix __shell_grep_replace)
    cp -r ${target_path} ${tmpdir}/
    echo "Backup target dir to ${tmpdir}."
  fi
  
  replace_all ${result[@]}
else
  display_all ${result[@]}
fi

