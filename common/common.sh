### common var
CUR=$(cd $(dirname $0); pwd)
CUR_DATE=`date '+%Y%m%d'`


### color
red=31
green=32
yellow=33
blue=34



################################################
# Coloring echo word.
#   first parameter is color variable which
#   this shell defined.
#
# Example:
#   common:cecho $red Error!
################################################
common:cecho() {

  if [ $# -eq 1 ]; then
    echo "$1"
    return
  fi

  color=$1
  shift
  echo -e "\033[${color}m$@\033[m"
}



################################################
# Coloring echo specific word based previous
# command return code.
#
# Example:
#   common:msg4rtn Success.
################################################
common:msg4rtn() {
  if [ $? -eq 0 ]; then
    cecho $green $1
  else
    cecho $red $2
  fi
}



################################################
# Show git branch name in Current directory.
#
# Example:
#   common:show_branch
################################################
common:show_branch() {
  cecho $1 `git rev-parse --abbrev-ref HEAD`
}



################################################
# Show git branch name in Current directory.
#
# Example:
#   common:get_file_timestamp /var/hoge.txt
################################################
common:get_file_timestamp(){
  ls -l --time-style='+%Y%m%d%H%M%S' $1  | awk '{print $6;}'
}
export -f common:get_file_timestamp
