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
		cwebp -short $file -o $(basename $file .png ).webp
		rm $file
	elif [[ $file == *.jpg ]]; then
		cwebp -short $file -o $(basename $file .jpg).webp
		rm $file
	elif [[ $file == *.jpg ]]; then
		cwebp -short $file -o $(basename $file .jpeg).webp
		rm $file
	elif [[ $file == *.gif ]]; then
		gif2webp -mixed -mt -metadata all $file -o $(basename $file .gif).webp
		rm $file
	fi
done

