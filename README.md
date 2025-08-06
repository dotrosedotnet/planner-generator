# Planner Maker

A tool for generating custom planners in various styles

## hopes and dreams

This project hopes to be a generator for custom planners. The dream is generation of a full year planner pdf which can then be easily printed. The pdf will include whatever sections (daily, weekly, monthly, etc.) the user wants, in whatever order they want, laid out how they want. There will be a web interface for the planner generator.

## implementation

I'm starting with hand-coded PostScript of a daily timeline. I'm having a blast building a `bash` script to implement settings from the `settings.md` files. I'm intending to do this whole project in bash and PostScript to maximize portability.

## usage

To see an example you can open a `.ps` file with most pdf viewers. And then you can replace setting vars. At least until the bash scripts get implemented.

## a todo

- [ ] daily timeline
  - [ ] dates
    - [ ] this will probably have to be controlled externally, as I don't think PostScript is handy with dates, and I don't want to make a bespoke date module lol
  - [ ] timeline
    - [ ] grid
      - [x] alignment
        - [x] horizontal left/center/right
        - [x] vertical top/center/bottom
      - [ ] grid generation
        - [ ] **iron out grid generation. too many rando `1 add` etc on rows and columns**
        - [ ] handle grids which don't fit on page
          - [ ] margins too large
            - [ ] lower margin size. stop at lower limit (`left/bottom/etc-margin-minimum`)
          - [ ] too many columns (if margin is at lower limit)
            - [ ] cap column count to fit
          - [ ] too many rows (if margin is at lower limit)
            - [ ] lower cell height
            - [ ] lessen padding (if cell height is at bottom limit)
            - [ ] fewer hours (if padding is entirely removed)
        - [ ] alternate line styles
          - [ ] place $`n`$ lines maximally distant from each other, apply offset to move lines
        - [x] adjustable vertical padding
      - [ ] line generation
        - [ ] alternate line styles
          - [ ] start with styles to choose from; allow more customization later
        - [x] horizontal and vertical line generation
        - [ ] line styles more predictably controlled
        - [ ] cell generation
          - [ ] more predictable line-style control
          - [x] symmetric cell lines
            - [x] ensure cell line ends start with dash, rather than space
              - [x] adjustable with dash offset
              - [x] dashes create crosses at intersections
      - [ ] hobonichi style lines (dot on cell intersection, four dashes between dots)
    - [ ] hours
      - [x] a numbering implementation
        - [x] numbers in 12 and 24 hour formats
        - [x] whiting out line behind numbers, based on number width
      - [ ] implement label frequency (every $`n`$ hours)
      - [ ] font changing
      - [ ] more elegant padding around digits (whiting out lines? clipping?)
        - [ ] more reliable digit height detection
      - [ ] adjustable horizontal hour placement
    - [ ] marks (I want bolder crosses at horizontal thirds, every three hours)
      - [ ] implement marks
- [ ] monthly calendar
