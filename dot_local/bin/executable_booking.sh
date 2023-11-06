#!/usr/bin/zsh

bookdir="$HOME/.local/share/books"
[ -f "$bookdir" ] && mkdir $bookdir

printf 'Title: ' && read -r title
printf 'Author: ' && read -r author
printf 'Format: ' && read -r format
printf 'Edition: ' && read -r edition
printf 'Number of pages: ' && read -r pages
printf 'Description: \n'
bookingFile="/tmp/booking.tmp"
printf 'Enter description..' > $bookingFile && nvim $bookingFile
description="$(cat $bookingFile 2> /dev/null)" && rm $bookingFile
printf 'Publisher: ' && read -r publisher
printf 'Date: ' && read -r date
printf 'ISBN: ' && read -r isbn
printf 'Status: ' && read -r status
added="$(date '+%a %d %b %H:%M')"

titleStrip=$(echo ${title:l}.book | sed "s/\ /_/g;s/\'//g;s/[éèê]/e/g;s/[ùû]/u/g;s/ô/o/g;s/[àâ]/a/g;")
echo $titleStrip
filename="$bookdir/$titleStrip"

printf "Title: $title
Author: $author
Format: $format
Edition: $edition
Number of pages: $pages
Description: $description
Publisher: $publisher
Date: $date
ISBN: $isbn
Status: $status
Date added: $added
" > $filename

nvim $filename
