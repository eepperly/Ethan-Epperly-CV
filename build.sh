#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

xelatex -interaction=nonstopmode cv.tex
xelatex -interaction=nonstopmode cv.tex   # second pass for cross-references

echo "Built cv.pdf"
