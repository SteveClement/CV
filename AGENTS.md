# Repository Guidelines

## Project Structure & Module Organization
- Current CV sources live at the root (e.g., `2023-06-21-sc-CV-SteveClement.tex`, `2023-06-21-sc-Bio-SteveClement.tex`). Supporting class files: `friggeri-cv.cls` and `awesome-cv.cls`.
- Assets are in `resources/` (logos for social links); archived CV/Bio snapshots and PDFs are in `Archive/`.
- `remotes/` holds per-company text snippets; `crypt.sh` encrypts/decrypts them and can unpack key/value `.txt` files into `.tex` fragments.
- Bibliography entries reside in `bibliography.bib`. Profile image lives at `profile.png`.

## Build, Test, and Development Commands
- Build CV PDF (XeLaTeX twice for stable refs): `xelatex 2023-06-21-sc-CV-SteveClement.tex` (repeat once); use `biber` afterward if bibliography is enabled, then one more `xelatex`.
- Build Bio PDF: `xelatex 2023-06-21-sc-Bio-SteveClement.tex`.
- Cover letter helpers: decrypt remote snippets `./crypt.sh dec`; generate per-target `.tex` files `./crypt.sh unpack sample`; re-encrypt sensitive files `./crypt.sh enc`.
- When fonts differ, ensure IPA fonts for Japanese (`zxjatype`) are installed before running XeLaTeX.

## Coding Style & Naming Conventions
- LaTeX uses two-space indentation; keep whitespace consistent with existing files.
- Prefer semantic macro names over inline styling; reuse class-provided commands before adding new formatting.
- File naming follows `YYYY-MM-DD-<initials>-<type>-SteveClement.tex` (e.g., `...-CV-...` or `...-Bio-...`); keep new variants consistent.
- Keep color palette and typography aligned with the Monokai-inspired scheme baked into the class/theme.

## Testing Guidelines
- No automated test suite; validate by compiling and visually inspecting the produced PDFs for layout issues, overfull hboxes, and missing assets.
- For bibliography-enabled runs, confirm `biber` completes without warnings and references resolve.
- Before sending external files, open the generated PDF to ensure logos, Japanese text (if used), and remote-injected snippets render correctly.

## Commit & Pull Request Guidelines
- Match existing log style: prefixes like `chg:` with scope in brackets (e.g., `chg: [CV] Updated interests`). Keep messages imperative and concise.
- PRs should describe the change, affected documents, and include before/after screenshots or PDFs when visual adjustments occur.
- Link relevant issues or request context, and note any font or TeX package prerequisites introduced.

## Security & Configuration Tips
- Keep `attention.tex` and files in `remotes/` encrypted (`./crypt.sh enc`) when not actively editing; avoid committing decrypted secrets.
- Do not store private company details in git history. Use `.gitignore` for generated per-company `.tex` fragments when adding new targets.
- If sharing outputs, strip metadata where needed and verify PDFs do not embed unintended data.
