# Directory Overview

This directory contains the LaTeX source files for a curriculum vitae (CV) and a biography. The documents are built using XeLaTeX and rely on the `friggeri-cv` and `awesome-cv` classes. The styling is inspired by the Monokai color scheme.

## Key Files

*   `2023-06-21-sc-CV-SteveClement.tex`: The main LaTeX file for the CV.
*   `2023-06-21-sc-Bio-SteveClement.tex`: The main LaTeX file for the biography.
*   `friggeri-cv.cls`: A custom LaTeX class that defines the structure and style of the CV and biography.
*   `awesome-cv.cls`: Another LaTeX class for CV creation, which seems to be an alternative or complementary to `friggeri-cv.cls`.
*   `bibliography.bib`: A BibTeX file containing a list of publications that can be referenced in the documents.
*   `crypt.sh`: A shell script for encrypting and decrypting sensitive information within the LaTeX files, particularly for cover letters.
*   `resources/`: A directory containing images and logos used in the documents.
*   `Archive/`: A directory containing older versions of the CV and bio.

## Usage

To build the documents, you will need a LaTeX distribution that includes `xelatex` and `biber`. The main files to compile are `2023-06-21-sc-CV-SteveClement.tex` and `2023-06-21-sc-Bio-SteveClement.tex`.

The `crypt.sh` script can be used to manage sensitive data in cover letters. The `README.md` file provides instructions on how to use it.
