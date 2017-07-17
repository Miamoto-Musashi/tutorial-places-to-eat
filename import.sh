#!/bin/bash

file=koeln-regbez-latest.osm.bz2

#download
if [[ ! -e $file ]]; then
    wget "http://download.geofabrik.de/europe/germany/nordrhein-westfalen/$file" \
        || { echo "download failed"; exit 1; }
fi

#extract

if [[ ! -e "${file%%.bz2}" ]]; then
    bunzip2 --keep --verbose $file \
        || { echo "extraction failed"; exit 1; }
fi

#import
./places_to_eat.py import "${file%%.bz2}" \
    || { echo "import failed"; exit 1; }
