#!/usr/bin/env bash

###############################
#                             #
#         PAGE SIZE           #
#         (string)            #
# options: a4-8, b4-8, custom #
#                             #
###############################

PAGE_SIZE="a6"

################################
#                              #
#     page orientation         #
#        (string)              #
# options: portrait, landscape #
#                              #
################################

PAGE_ORIENTATION="landscape"

################################
#                              #
#         page_width           #
#         (integer)            #
#   units: points (1/72 inch)  #
#                              #
################################

PAGE_WIDTH=294

################################
#                              #
#         page_height          #
#          (integer)           #
#   units: points (1/72 inch)  #
#                              #
################################

PAGE_HEIGHT=419

################################
#                              #
#            hours             #
#          (integer)           #
#            >= 1              #
#                              #
################################

HOURS=24

################################
#                              #
#         clock type           #
#         (integer)            #
#          12 or 24            #
#                              #
################################

CLOCK_TYPE=12

################################
#                              #
#   hour marking frequency     #
#         (integer)            #
#           >= 1               #
#                              #
################################

HOUR_MARKING_FREQUENCY=3

################################
#                              #
#        rows per hour         #
#         (integer)            #
#           >= 1               #
#                              #
################################

ROWS_PER_HOUR=1

################################
#                              #
#         first hour           #
#         (integer)            #
#           > 0                #
#       =< clock type          #
#                              #
################################

FIRST_HOUR=3

################################
#                              #
#     first hour marking       #
#         (integer)            #
#           > 0                #
#       =< clock type          #
#                              #
################################

FIRST_HOUR_MARKING=3

################################
#                              #
#      vertical padding        #
#     for timeline hours       #
#         (integer)            #
#           >= 0               #
#                              #
################################

CELLS_PADDING_TIMELINE=2

################################
#                              #
#         cell height          #
#      (string of number)      #
#           > 0                #
#         millimeters          #
#                              #
################################

CELL_HEIGHT="3.7"

################################
#                              #
#         cell width           #
#      (string of number)      #
#            > 0               #
#         millimeters          #
#                              #
################################

CELL_WIDTH="3.7"

################################
#                              #
#       full width grid        #
#           boolean            #
#                              #
################################

MAX_WIDTH_GRID=false

################################
#                              #
#     desired row length       #
#          (integer)           #
#            > 0               #
#                              #
################################

DESIRED_ROW_LENGTH=15

# top_margin_width

## (mm)

## >= 0

TOP_MARGIN_WIDTH=5

# bottom_margin

## (mm)

## >= 0

BOTTOM_MARGIN=5

# left_margin

## (mm)

## >= 0

LEFT_MARGIN=6

# right_margin_width

## (mm)

## >= 0

RIGHT_MARGIN_WIDTH=6

# vertical_grid_alignment

## top

## center

## bottom

VERTICAL_GRID_ALIGNMENT="center"

# horizontal_grid_alignment

## left

## center

## right

HORIZONTAL_GRID_ALIGNMENT="center"

# linewidth

## points

## > 0

LINEWIDTH="0.2"

# fontscale

## (number: point)

## > 0

FONTSCALE="cell_height 2 sub"
