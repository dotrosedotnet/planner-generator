#!/usr/bin/env bash

###############################
#                             #
#         PAGE SIZE           #
#         (string)            #
# options: a4-8, b4-8, custom #
#                             #
###############################

page_size="a6"

################################
#                              #
#     page orientation         #
#        (string)              #
# options: portrait, landscape #
#                              #
################################

page_orientation="landscape"

################################
#                              #
#         page_width           #
#         (integer)            #
#   units: points (1/72 inch)  #
#                              #
################################

page_width=294

################################
#                              #
#         page_height          #
#          (integer)           #
#   units: points (1/72 inch)  #
#                              #
################################

page_height=419

################################
#                              #
#            hours             #
#          (integer)           #
#            >= 1              #
#                              #
################################

hours=24

################################
#                              #
#         clock type           #
#         (integer)            #
#          12 or 24            #
#                              #
################################

clock_type=12

################################
#                              #
#   hour marking frequency     #
#         (integer)            #
#           >= 1               #
#                              #
################################

hour_marking_frequency=3

################################
#                              #
#        rows per hour         #
#         (integer)            #
#           >= 1               #
#                              #
################################

rows_per_hour=1

################################
#                              #
#         first hour           #
#         (integer)            #
#           > 0                #
#       =< clock type          #
#                              #
################################

first_hour=3

################################
#                              #
#     first hour marking       #
#         (integer)            #
#           > 0                #
#       =< clock type          #
#                              #
################################

first_hour_marking=3

################################
#                              #
#      vertical padding        #
#     for timeline hours       #
#         (integer)            #
#           >= 0               #
#                              #
################################

cells_padding_timeline=2

################################
#                              #
#         cell height          #
#      (string of number)      #
#           > 0                #
#         millimeters          #
#                              #
################################

cell_height="3.7"

################################
#                              #
#         cell width           #
#      (string of number)      #
#            > 0               #
#         millimeters          #
#                              #
################################

cell_width="3.7"

################################
#                              #
#       full width grid        #
#           boolean            #
#                              #
################################

max_width_grid=false

################################
#                              #
#     desired row length       #
#          (integer)           #
#            > 0               #
#                              #
################################

desired_row_length=15

################################
#                              #
#         tom margin           #
#      (number as string)      #
#           >= 0               #
#                              #
################################

top_margin_width="5 mm"

################################
#                              #
#        bottom margin         #
#      (number as string)      #
#           >= 0               #
#                              #
################################

bottom_margin="5 mm"

################################
#                              #
#         left margin          #
#      (number as string)      #
#           >= 0               #
#                              #
################################

left_margin="6 mm"

################################
#                              #
#         left margin          #
#      (number as string)      #
#           >= 0               #
#                              #
################################

right_margin_width="6 mm"

################################
#                              #
#   vertical grid alignment    #
#         (string)             #
#    top, bottom, or center    #
#                              #
################################

vertical_grid_alignment="center"

################################
#                              #
#  horizontal grid alignment   #
#         (string)             #
#    left, center, or right    #
#                              #
################################

horizontal_grid_alignment="center"

################################
#                              #
#        line width            #
#     (number as string)       #
#           =< 0               #
#                              #
################################

linewidth="0.2"

################################
#                              #
#        font scale            #
#     (number as string)       #
#           =< 0               #
#                              #
################################

fontscale="cell_height 2 sub"
