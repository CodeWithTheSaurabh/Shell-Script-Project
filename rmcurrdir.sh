#!/bin/bash

# Function to remove files older than 4 days based on file name
remove_old_files() {
    current_date=$(date +%s)
    threshold_date=$(date -d "4 days ago" +%Y%m%d)

    for file in *; do
        if [ -f "$file" ]; then
            file_date=$(echo "$file" | sed 's/[^0-9]*//g')
            if [ "$file_date" -lt "$threshold_date" ]; then
                rm -f "$file"
                echo "Removed $file"
            fi
        fi
    done
}

# Main program
echo "Removing files older than 4 days based on their file names..."
remove_old_files
echo "File removal process completed."
