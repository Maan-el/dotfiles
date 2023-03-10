sorthelper=()
for file in ./*; do
	sorthelper+=("$(stat --printf "%Y    %n" -- "$file")")    
done

sorted=()
while read -d $'\0' elem; do
	sorted+=("${elem:14}")
done < <(printf '%s\0' "${sorthelper[@]}" | sort -z)

for file in "${sorted[@]}"; do
	if [[ $file == *.png ]]; then
		cwebp -short -metadata all $file -o $(basename $file .png ).webp &
		wait
		rm $file
	elif [[ $file == *.jpg ]]; then
		cwebp -short -metadata all $file -o $(basename $file .jpg).webp &
		wait
		rm $file
	elif [[ $file == *.jpg ]]; then
		cwebp -short -metadata all $file -o $(basename $file .jpeg).webp &
		wait
		rm $file
	elif [[ $file == *.gif ]]; then
		gif2webp -mixed -mt -metadata all $file -o $(basename $file .gif).webp &
		wait
		rm $file
	elif [[ $file == *.mp4 ]]; then
		cp $file $(basename $file .mp4)1.mp4 &
		wait
		rm $file
	elif [[ $file == *.webm ]]; then
		cp $file $(basename $file .webm)1.webm &
		wait
		rm $file
	fi
done

