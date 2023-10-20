#!/bin/env bash

if [[ ! "$(command -v rg)" ]]; then
	echo "comando \"rg\" (ripgrep) não encontrado nesse sistema.";
	exit 1
fi

if [[ ! "$(command -v fd)" ]]; then
	echo "comando \"fd\" (fd-find) não encontrado nesse sistema.";
	exit 1
fi

for file in $(rg --sort modified -g '*.jpeg' -g '*.jpg' -g '*.png' -g '*.gif' -g '*.mp4' --files); do
	if [[ $file == *.png ]]; then
		cwebp -metadata all "$file" -o "$(basename $file .png )".webp &
		wait;
	elif [[ $file == *.jpg ]]; then
		cwebp -metadata all "$file" -o "$(basename $file .jpg)".webp &
		wait;
	elif [[ $file == *.jpeg ]]; then
		cwebp -metadata all "$file" -o "$(basename $file .jpeg)".webp &
		wait;
	elif [[ $file == *.gif ]]; then
		gif2webp -mixed -mt -metadata all "$file" -o "$(basename $file .gif)".webp &
		wait;
	elif [[ $file == *.mp4 ]]; then
		ffmpeg -i "$file" -c:v libaom-av1 -strict -2 "$(basename $file .mp4)".mkv &
		wait;
	elif [[ $file == *.webm ]]; then #TODO
		cp "$file" "$(basename $file .webm)"1.webm &
		wait;
	fi
done

# Comando roda instantaneamente, por isso irei usá-lo ao iinvé de botar a saída do rg em uma variável
fd . './' -e jpg -e png -e jpeg -e gif -e mp4 --exec-batch rm {};