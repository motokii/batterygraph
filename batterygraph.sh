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
script_dir="$(abs_dirname "$0")"
LABEL="motokii.batterylogger"
PLIST_FILE="${script_dir}/src/plist/${LABEL}.plist"
LOADED_PLIST_FILE="${HOME}/Library/LaunchAgents/${LABEL}.plist"
cd $script_dir

function load {
  ${script_dir}/src/plist/creater.sh
  echo "loading ${LOADED_PLIST_FILE}"
  ln -s $PLIST_FILE $LOADED_PLIST_FILE
  launchctl load $LOADED_PLIST_FILE
}

function unload {
  echo "unloading ${LOADED_PLIST_FILE}"
  launchctl unload $LOADED_PLIST_FILE
  unlink $LOADED_PLIST_FILE
}

function showstatus {
  launchctl list $LABEL
}

function showgraph {
  ruby ${script_dir}/src/viewer_console/view.rb
}

function batterygraph {
  case "$1" in
    "load" )
      load ;;

    "unload" )
      unload ;;

    "status" )
      showstatus ;;

    "show" )
      showgraph ;;
  esac
}

batterygraph $1

