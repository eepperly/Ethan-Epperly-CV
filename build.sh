#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

# Regenerate publication lists (LaTeX for the CV, Markdown for the README)
python3 make_cvpubs.py epperly_ethan.bib \
  --markdown readme/pubs.md \
  --selected-tex cv/selected.tex \
  --selected-markdown readme/selected.md > cv/publications.tex

# README = head + selected publications + publications + tail
{
  cat readme/head.md
  echo "## Selected Publications"
  echo
  cat readme/selected.md
  echo
  echo "## Publications"
  echo
  cat readme/pubs.md
  echo
  cat readme/tail.md
} > README.md

xelatex -interaction=nonstopmode cv.tex
xelatex -interaction=nonstopmode cv.tex   # second pass for cross-references

echo "Built cv.pdf and README.md"
