function usage {
  echo
  common:cecho "  $(basename ${0}) is find by timestamp. "
  echo
  common:cecho $green "  Usage:" 
  common:cecho "    $(basename ${0}) <find path> <mtime>"
  echo
  common:cecho $yellow "      <find_path>"
  common:cecho "           "
  echo
  common:cecho $yellow "      <mtime>"
  common:cecho "           "
  echo
  common:cecho $green "  Example:"
  common:cecho "    ./$(basename ${0}) /temp/test -3  #from 3day ago to current."
  common:cecho "    ./$(basename ${0}) /temp/test 3   #3days ago all day."
  common:cecho "    ./$(basename ${0}) /temp/test +3  #older than [3] ."
  echo
  common:cecho $green "  Options:"
  common:cecho "    --help, -h    print this."
  common:cecho "    --debug, -d   debug mode."
  echo
}


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
