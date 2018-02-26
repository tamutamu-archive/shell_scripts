function usage {
  echo
  common:cecho "  $(basename ${0}) outputs port and process. "
  echo
  common:cecho $green "  Usage:" 
  common:cecho "    $(basename ${0})"
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
  ;;
esac
