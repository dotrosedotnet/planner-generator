#!/usr/bin/env bash

# this file will eventually take arguments from the page orchestrator script
# but for now, it will watch the settings and ps files and update a tmp version for viewing

# Control Flow
# make tmp folder
# generate timeline.tmp.ps from timeline.ps and timeline_settings.md
# watch timeline.ps and timeline_settings.md for changes
# update timeline.tmp.ps
# delete tmp folder on quit

grep -niIr "^#\ " timeline_settings.md
