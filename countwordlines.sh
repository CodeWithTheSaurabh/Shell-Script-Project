#!/bin/bash

# Function to count words, lines, and characters in a file
count_stats() {
    file=$1
    words=$(wc -w < "$file")
    lines=$(wc -l < "$file")
    characters=$(wc -m < "$file")
    echo "File: $file"
    echo "Words: $words"
    echo "Lines: $lines"
    echo "Characters: $characters"
    echo "=================="
}

# Main program
if [ $# -eq 2 ]; then
    file1=$1
    file2=$2

    if [ -f "$file1" ] && [ -f "$file2" ]; then
        count_stats "$file1"
        count_stats "$file2"
    else
        echo "Error: One or both files do not exist."
    fi
else
    echo "Usage: ./word_count.sh <file1> <file2>"
fi
