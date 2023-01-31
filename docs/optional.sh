#!/usr/bin/env bash
set -e # exit on error

paru -S shell-color-scripts pipes-sh

paru -S tesseract gimagereader-qt tesseract-data-chi_sim tesseract-data-eng # gimagereader-qt can be replaced with gimagereader-gtk

# sudo archlinux-java set java-8-openjdk/jre
