# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal CV/resume repository using LaTeX templates (Friggeri CV and Awesome CV) to generate professional PDF documents. The repository contains:
- CV (Curriculum Vitae) documents
- Bio documents (short and long biographical texts)
- Cover letter templates with encrypted company-specific data
- Archived versions dating back to 2014

## Document Types and Current Files

The repository follows a date-based naming convention: `YYYY-MM-DD-sc-[TYPE]-SteveClement.tex`

Current active documents (as of 2023-06-21):
- `2023-06-21-sc-CV-SteveClement.tex` - Full CV using friggeri-cv.cls
- `2023-06-21-sc-Bio-SteveClement.tex` - Professional bio using friggeri-cv.cls
- `2023-06-21-sc-Cover-SteveClement.tex` - Cover letter template using awesome-cv.cls

## LaTeX Compilation

All documents must be compiled with **XeLaTeX** (not pdflatex):

```bash
xelatex 2023-06-21-sc-CV-SteveClement.tex
xelatex 2023-06-21-sc-Bio-SteveClement.tex
xelatex 2023-06-21-sc-Cover-SteveClement.tex
```

Bibliography support (currently commented out) requires `biber` rather than `bibtex`.

### Required Fonts
- Helvetica Neue (via XeTeX and fontspec)
- Japanese fonts from IPA (http://ipafont.ipa.go.jp/old/ipafont/download.html) for CJK support

### Document Class Options
- Add `print` option to document class for black-and-white printing (e.g., `\documentclass[a4paper,print]{friggeri-cv}`)
- `a4paper` is the default paper size

## Cover Letter Encryption System

Cover letters contain company-specific information that is encrypted using GPG for privacy.

### Workflow

1. **Create company data file** in `remotes/[name].txt` with this format:
```
COMPANYADDRESS:ACME Inc.\\123, Foo Street\\L-4200 Luxembourg, Luxembourg
JOBAPPLICATION:Job Application for cybersecurity cybering \& responding expert
COMPANYNAME:ACME
CORESERVICE:amazing cyber services
```

2. **Unpack** the data file to create individual .tex files:
```bash
./crypt.sh unpack [name]
```
This creates: `COMPANYADDRESS.tex`, `JOBAPPLICATION.tex`, `COMPANYNAME.tex`, `CORESERVICE.tex`

3. **Compile** the cover letter:
```bash
xelatex 2023-06-21-sc-Cover-SteveClement.tex
```

4. **Encrypt** sensitive files after use:
```bash
./crypt.sh enc
```
This encrypts files to GPG armored format (`.asc` files)

5. **Decrypt** when needed:
```bash
./crypt.sh dec
```

### Security Notes
- The `attention.tex` file is also encrypted/decrypted and contains a note about the application process
- All `.tex` files generated from company data are in `.gitignore` to prevent accidental commits
- Encryption uses GPG with key for `steve@localhost.lu`

## Template Classes

### friggeri-cv.cls
Used for CV and Bio documents. Features:
- TikZ-based header with colored background
- Custom aside environment for sidebar information
- Entry list environment for experience/education sections
- Color scheme inspired by Monokai
- Supports both light and dark header modes

### awesome-cv.cls
Used for cover letters. Features:
- Professional cover letter formatting
- Header with photo support
- Social media links (GitHub, LinkedIn, Twitter)
- Letter-specific sections and formatting

## Architecture

### Directory Structure
- `/` - Current/active documents and template classes
- `/Archive/` - Historical versions of CV and Bio documents (2014-2022)
- `/remotes/` - Encrypted company-specific data files (`.txt.asc`)
- `/resources/` - Additional resources

### Key Files
- `bio.md` - Markdown source containing multiple bio variants (Micro, Short, Long, Biz, etc.)
- `crypt.sh` - GPG encryption/decryption utility for cover letter data
- `bibliography.bib` - BibTeX bibliography (currently unused but available)
- `profile.png` - Profile photo used in cover letters

## Versioning Strategy

When creating new versions:
1. Use the date format: `YYYY-MM-DD-sc-[TYPE]-SteveClement.tex`
2. Move old versions to the `Archive/` directory
3. Generate PDF and consider archiving it as well
4. Keep the same template class unless changing design

## Common Development Tasks

When updating the CV:
- Edit the current dated `.tex` file directly
- Maintain consistency between CV and Bio documents
- Update `bio.md` for source-of-truth biographical content
- Archive old versions before making major structural changes

When updating templates:
- Modify `.cls` files carefully - they affect all documents
- Test changes on all document types (CV, Bio, Cover)
- Note that friggeri-cv.cls supports Japanese via zxjatype package
