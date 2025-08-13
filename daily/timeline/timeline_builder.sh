#!/usr/bin/env bash

################################################################################
# this file will eventually take arguments from the page orchestrator script,
# but for now, it will watch the settings and ps files and update a tmp version
# for viewing
################################################################################

# unofficial bash strict mode
# TODO: reconsider regarding http://mywiki.wooledge.org/BashPitfalls#set_-euo_pipefail
set -euo pipefail IFS=$'\n\t'

# keep the script from running outside of it's directory
readonly SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
readonly CURRENT_DIR=$(pwd)
if [ "$SCRIPT_DIR" != "$CURRENT_DIR" ]; then
  echo "Error: This script must be run from it's location: ""$SCRIPT_DIR"
  exit 1
fi

##=============##
# let's do this #
##=============##

# GAMEPLAN
# - [x] make tmp folder
# - [x] watch timeline.ps and timeline_settings.sh for changes
# - [ ] generate timeline.tmp.ps from timeline.ps and timeline_settings.sh
#   - [ ] use default values if there are no matches
# - [ ] update timeline.tmp.ps when:
#   - [x] shell script is changed
#   - [x] ps file is changed
#   - [ ] settings file is changed
# - [x] delete tmp on script complete
# - [x] delete tmp folder on Ctrl+C

readonly THIS_SCRIPT=$(readlink -f "$0")
readonly SCRIPT_NAME=$(basename "$0")
readonly PS_FILE=$(ls | grep .ps)
# there are 4 instances of `local PS_FILE` (2025-08-07)
# maybe it should be a global var

cleanup() {
  echo "Cleaning up..."
  rm -rvf tmp
  echo -e "Cleanup complete.\n"
}

sigint_proc() {
  echo $'\n'$'\n'"Ctrl+C detected."$'\n'
  cleanup
  exit 1
}

restart() {
  cleanup
  sleep 2
  exec "$THIS_SCRIPT"
}

cleanup_and_exit() {
  cleanup
  exit 1
}

# delete tmp on ctrl+c
trap sigint_proc SIGINT

# delete tmp on normal exits
trap restart EXIT

mk_tmp_cp_ps() {
  echo "making tmp folder"
  mkdir tmp
  echo "copying ps file to tmp folder"
  cp "$PS_FILE" tmp/
}

pdf_convert() {
  # requires ghostscript
  pdf_name=$(echo $PS_FILE | awk -F'.' '{print $1}')".pdf"
  echo "converting ps to pdf in tmp folder"
  ps2pdf tmp/"$PS_FILE" tmp/"$pdf_name"
}

start_zathura_on_tmp_ps() {
  # not running this until I track the PID and don't restart if still running
  zathura tmp/"$PS_FILE" &!
}

print_changed_file() {
  ls -1tr | tail -1 | awk '{print $1" changed!\n"}'
}

restart_on_script_edit() {
  local EDITED_FILE=$(ls -1tr | tail -1)
  if [[ "$EDITED_FILE" == "$SCRIPT_NAME" ]]; then
    echo $'\n'"script file edited. restarting script."$'\n'
    cleanup
    sleep 2
    exec "$THIS_SCRIPT"
  fi
}

# # takes in setting key from associative array and locates corresponding value
# # in ps file
# locate_ps_definition_wo_braces() {}
#
# locate_ps_definition_with_braces() {}
#
# # function which replaces a setting in the tmp ps file with a setting
# # in the settings file
# #
# # will take in a variable from the settings file, find the corresponding
# # location to overwrite, and overwrite it
# tmp_ps_file_setting_writer() {}

# source the settings, populate an associative array
# declare -A settings
create_settings_associative_array() {
  local SETTINGS_FILE="${PS_FILE%.*}_settings.sh"
  local SETTINGS_LINES=$(grep -ve "^#" -e "^$" "$SETTINGS_FILE")
  # if settings was most recently edited file:
  #  echo "settings updated, recopying to tmp file "
  local -A settings
  while IFS= read -r line; do
    # echo "$line"
    local setting_key=$(echo "$line" | awk -F'=' '{print $1}')
    local setting_val=$(echo "$line" | awk -F'=' '{print $2}')
    settings["$setting_key"]="$setting_val"
  done <<< "$SETTINGS_LINES"
  for key in ${!settings[@]}
  do
    echo "$key"\ is\ "${settings[${key}]}"
  done
  
}

create_settings_associative_array

update_tmp_ps_settings() {
  local SETTINGS_FILE="${PS_FILE%.*}_settings.sh"
  local SETTINGS_LINES=$(grep "^# " "$SETTINGS_FILE")
  # if settings was most recently edited file:
  #  echo "settings updated, recopying to tmp file "
  while IFS= read -r line; do
    #
    # find the line in the file, and find the next instance of line beginning
    # with alphanumeric chars, as that will be the corresponding setting 
    #
    local SETTING_NAME=$(echo "$line" | awk '{print $2}')
    # echo "$SETTING_NAME"\:
    # awk '/'"$line"'/{found=1; next} found && /^\w/{print; exit}' "$SETTINGS_FILE"
  done <<< "$SETTINGS_LINES"
  echo "=========="$'\n'
}

recopy_ps_on_ps_edit() {
  local EDITED_FILE=$(ls -1tr | tail -1)
  if [[ "$EDITED_FILE" == "$PS_FILE" ]]; then
    cleanup
    echo $'\n'"PS source edited. recopying to tmp"$'\n'
    # update_tmp_ps_settings
    mk_tmp_cp_ps
    pdf_convert
  fi
}

watch_files() {
  local LAST_MOD_TIME=$(stat -c %Y .)
  while true; do
    local CURRENT_MOD_TIME=$(stat -c %Y .)
    if [[ "$CURRENT_MOD_TIME" != "$LAST_MOD_TIME" ]]; then
      sleep 0.25
      print_changed_file
      restart_on_script_edit
      recopy_ps_on_ps_edit
      # update_tmp_ps_settings
      LAST_MOD_TIME="$CURRENT_MOD_TIME"
    fi
    sleep 1
  done
}

main() {
  echo -e "\nScript started.\n"
  mk_tmp_cp_ps
  pdf_convert
  watch_files
  cleanup
}

main
