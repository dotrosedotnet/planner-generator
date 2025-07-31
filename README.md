# Planner Maker

A tool for generating custom Hobonichi-style planners

## Description

This project hopes to be a generator for custom planners. The dream is generation of a full year planner pdf which can then be easily printed. The pdf will include whatever sections (daily, weekly, monthly, etc.) the user wants, in whatever order they want, laid out how they want. There will be a web interface for the planner generator.

I'm starting with hand-coded postscript of a daily timeline. I suspect that I'll want to generate the postscript with another language eventually. I'm tempted to use `bash` so that most anybody could run this without needing more software.

I suspect that a web implementation will use `ps2pdf` and embed a pdf viewer.

- [ ] **remove residue from previous implementation**

- [ ] daily timeline
  - [ ] dates
    - [ ] this will probably have to be controlled externally, as I don't think postscript is handy with dates, and I don't want to make a bespoke date module lol
  - [ ] timeline
    - [ ] grid
      - [ ] grid generation
        - [ ] iron out grid generation. too many rando `1 add` etc on rows and columns
        - [ ] handle grids which don't fit on page
          - [ ] margins too large
            - [ ] lower to lower limit
          - [ ] too many columns (if margin is at lower limit)
            - [ ] cap column count to fit
          - [ ] too many rows (if margin is at lower limit)
            - [ ] lower cell height
            - [ ] lessen padding (if cell height is at bottom limit)
            - [ ] fewer hours (if padding is entirely removed)
        - [ ] alternate line styles
          - [ ] place $`n`$ lines maximally distant from each other, apply offset to move lines
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
    - [ ] marks (I want bolder crosses at horizontal thirds, every three hours)
      - [ ] implement marks
- [ ] monthly calendar
