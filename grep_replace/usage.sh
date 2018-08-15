function usage {
  echo
  common:cecho "  $(basename ${0}) is grep replace utility script. "
  echo
  common:cecho $green "  Usage:" 
  common:cecho "    $(basename ${0}) <OPTIONS....>"
  echo
  common:cecho $yellow "      -t <target path>"
  common:cecho "           find target directory.         "
  echo
  common:cecho $yellow "      -n <name pattern>"
  common:cecho "           find name pattern.         "
  echo
  common:cecho $yellow "      -g <grep word pattern>"
  common:cecho "           grep word pattern.         "
  echo
  common:cecho $yellow "      -r"
  common:cecho "           whether replace or not.         "
  echo
  common:cecho $yellow "      -w <replace word>"
  common:cecho "           grep word pattern to replace word.         "
  echo
  common:cecho $yellow "      -b"
  common:cecho "           backup target path before replace.         "
  echo
  common:cecho $yellow "      -y"
  common:cecho "           replace dry-run. Display replace result.         "
  echo
  common:cecho $yellow "      -h"
  common:cecho "           help.         "
  echo
  common:cecho $green "  Example:"
  common:cecho "    ./$(basename ${0}) -t /tmp -n 'test*' -g aaadd"
  common:cecho "    ./$(basename ${0}) -t /tmp -n 'test*' -g aaaaa -r -w AAAAA"
  common:cecho "    ./$(basename ${0}) -t /tmp -n 'test*' -g aaaaa -r -w AAAAA -y"
  common:cecho "    ./$(basename ${0}) -t /tmp -n '*' -g aaaaa -r -w AAAAA --b"
  echo
  echo
}


REPLACE_MODE=false
PRE_BACKUP=false
DRY_RUN=false


while getopts t:n:g:rw:dbyh OPT
do
    case $OPT in
        t)
           target_path=${OPTARG}
           ;;
        n)
           name_ptn=${OPTARG}
           ;;
        g)
           grep_ptn=${OPTARG}
           ;;
        r)
           REPLACE_MODE=true
           ;;
        w)
           replace_word=${OPTARG}
           ;;
        b)
           PRE_BACKUP=true
           ;;
        y)
           DRY_RUN=true
           ;;
        d)
           set -x
           ;;
        h)
           usage
           exit 0
           ;;
       \?)
           usage
           exit 0
           ;;
    esac
done


if [ -z "${name_ptn}" ]; then
  name_ptn='*'
fi
