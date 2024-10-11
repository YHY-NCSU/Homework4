grep -l "sample" dataset1/* | while read file; do
    csc510_count=$(grep -o "CSC510" "$file" | wc -l)
    if [ "$csc510_count" -ge 3 ]; then
        echo "$csc510_count $file"
    fi
done | sort -k1,1nr -k2,2 | while read count file; do
    new_file=$(echo "$file" | sed 's/file_/filtered_/')
    echo "$new_file"
done
