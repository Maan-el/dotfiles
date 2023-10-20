#! /usr/bin/env bash

fd . './' -e jpg -e png -e jpeg --exec cwebp -metadata all {} -o "{.}".webp;
fd . './' -e jpg -e png -e jpeg --exec-batch rm {};
# Need to find the right config, because the webp gifs are laging _a lot_
fd . './' -e gif --exec gif2webp -mt -metadata all -m 6 -q 100 {} -o "{.}".webp;
fd . './' -e jpg -e png -e jpeg -e gif --exec-batch rm {};

# fd . './' -e jpg -e png -e jpeg --exec-batch rm {};

fd . './' -e mp4 --exec ffmpeg -i {} -c:v libaom-av1 -strict -2 "{.}".mkv;
fd . './' -e mp4 --exec-batch rm {};