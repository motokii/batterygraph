#!/bin/bash
abs_dirname() {
  local cwd="$(pwd)"
  local path="$1"

  while [ -n "$path" ]; do
    cd "${path%/*}"
    local name="${path##*/}"
    path="$(readlink "$name" || true)"
  done

  pwd -P
  cd "$cwd"
}
LABEL="motokii.batterylogger"
PLIST_FILE="${LABEL}.plist"
script_dir="$(abs_dirname "$0")"
cd $script_dir

function load {
  ${script_dir}/src/plist/creater.sh
  echo "loading ${PLIST_FILE}"
  launchctl load $script_dir/src/plist/motokii.batterylogger.plist
}

function unload {
  echo "unloading ${PLIST_FILE}"
  launchctl unload $script_dir/src/plist/motokii.batterylogger.plist
}

function status {
  launchctl list $LABEL
}

function show {
  ruby ${script_dir}/src/viewer_console/view.rb
}

function batterygraph {
  case "$1" in
    "load" )
      load ;;

    "unload" )
      unload ;;

    "status" )
      status ;;

    "show" )
      show ;;
  esac
}

batterygraph $1

