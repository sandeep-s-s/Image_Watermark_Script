#!/bin/bash
#Before running this script you need to install Imagemagick (image editing software)
#For ImageMagick https://gist.github.com/rodleviton/74e22e952bd6e7e5bee1 
# Initialize variables
WM=$HOME/Documents/watermark.png  # This is the path to your watermark image
SCALE=65                         # This sets the scale % of your watermark image

# Warning
echo -e "This will overwrite all of the images in this directory."\\n"Are you shure want to continue? {Y/n}"
read REPLY

if
	[ "$REPLY" != "n" ] && [ "$REPLY" != "N" ]
then
	for pic in *.jpg; do # This will works for all image formats ,also works with single page pdf file
        	echo Watermarking $pic
        	#composite command works only after installing Imagemagick
			composite -dissolve 55% -gravity center -quality 100 \( $WM -resize $SCALE% \) "$pic" "$pic"
        done
else
	echo exiting
	exit 0
fi
#End

