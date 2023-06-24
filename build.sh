#!/usr/bin/env bash

set -euo pipefail

docker run --rm -v `pwd`:`pwd` -w `pwd` tianon/latex pdflatex -output-directory dist -interaction errorstopmode -halt-on-error resume.tex
