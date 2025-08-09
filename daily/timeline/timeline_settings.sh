#!/usr/bin/env bash

############################################################
#
# PAGE SIZE
# (string)
# a4-8
# b4-8
# custom
# 
############################################################

PAGE_SIZE="a6"

# page orientation
## (string)
## options: portrait, landscape

PAGE_ORIENTATION="landscape"

# page_width

## (number: point)

PAGE_WIDTH=294

# page_height
## (number: point)

PAGE_HEIGHT=419

# hours

## (int)

## 1-? however many fit

HOURS=24

# clock_type

## (int)

## 12

## 24

CLOCK_TYPE=12

# hour_marking_frequency

## (int)

## 1-?

HOUR_MARKING_FREQUENCY=3

# rows_per_hour

## (int)

## 1+ (probably one or two)

ROWS_PER_HOUR=1

# first_hour

## (int)

## > 0

## =< clock_type

FIRST_HOUR=3

# first_hour_marking

## (int)

## > 0

## =< clock_type

FIRST_HOUR_MARKING=3

# cells_padding_timeline

## (int)

## >= 0

CELLS_PADDING_TIMELINE=2

# cell_height

## (number: mm)

## > 0

CELL_HEIGHT=4

# cell_width

## (number: mm)

## > 0

CELL_WIDTH=4

# max_width_grid

## (bool)

MAX_WIDTH_GRID=false

# desired_row_length

## (int)

## > 0

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
