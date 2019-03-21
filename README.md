# Worksheets for MXN601

Developed by Joshua Bon and Chris Drovandi.

# Project structure

- Each worksheet is a folder (`ws01` etc).
- `question-bank` contains all questions (as individual files) used in worksheets.
- `solution-bank` contains all solutions (as individual files) used in worksheets.
- `src` contains the files used to construct the worksheets layout.


## Create a new worksheet

To create a new worksheet: 
1. Copy the `template` folder, rename to `ws##`.
2. Rename the `mxn601-ws-template.Rmd` file to `mxn601-ws-##.Rmd`.
3. Add content to new rmarkdown document.

## Compiling worksheets

The script `compile-worksheets-and-solutions.R` contains code to compile all worksheets and solutions for them. See comments for more details.