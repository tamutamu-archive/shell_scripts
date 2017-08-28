function usage {
  echo
  common:cecho "  $(basename ${0}) is find by timestamp. "
  echo
  common:cecho $green "  Usage:" 
  common:cecho "    $(basename ${0}) <process name>"
  echo
  common:cecho $yellow "      <process name>"
  common:cecho "         All backward match."
  echo
  common:cecho $green "  Example:"
  common:cecho "    ./$(basename ${0}) httpd"
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
    if [ $# -lt 1 ]; then
      usage
      exit 1
    fi
  ;;
esac
