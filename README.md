# Planner Maker

A tool for generating custom Hobonichi-style planners

## Description

This project hopes to be a generator for custom planners. The dream is generation of a full year planner pdf which can then be sent to a printer. The pdf will include whatever sections the user wants, in whatever order they want, laid out how they want. There will be a web interface for the planner generator.

I'm starting with hand-coded postscript of a daily timeline. I suspect that I'll want to generate the postscript with python eventually. I look forward to exploring options for the web interface. Recommendations welcome.

- [ ] timeline
  - [ ] grid
    - [ ] lines
      - [ ] alternate line styles
        - [ ] place $`n`$ lines maximally distant from each other, apply offset to move lines
        - [ ] start with styles to choose from; allow more customization later
      - [x] dashes create crosses at intersections
      - [x] horizontal and vertical line generation
      - [ ] line styles more predictably controlled
    - [ ] hobonichi style lines (dot on cell intersection, four dashes between dots)
    - [ ] hours
      - [x] a numbering implementation
      - [ ] implement label frequency (every $`n`$ hours)
    - [ ] marks (I want bolder crosses at horizontal thirds, every three hours)
      - [ ] implement marks
