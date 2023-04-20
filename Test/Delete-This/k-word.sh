#!/bin/bash

# Check that 2 arguments are given
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <text_file> <k>"
    exit 1
fi

# Assign arguments to variables
text_file=$1
k=$2

# Check that text file exists
if [ ! -f "$text_file" ]; then
    echo "Error: File $text_file not found."
    exit 1
fi

# Read stopwords into an array
stopwords_file="stopwords"
if [ ! -f "$stopwords_file" ]; then
    echo "Error: File $stopwords_file not found."
    exit 1
fi
stopwords=()
while read -r line; do
    stopwords+=("$line")
done < "$stopwords_file"

# Count the frequency of each word and sort by frequency (highest to lowest) and alphabetically if there's a tie
word_counts=$(tr -c '[:alnum:]' '[\n*]' < "$text_file" | tr '[:upper:]' '[:lower:]' | awk '!($0 in stopword) && length($0) > 0 {count[$0]++} END {for (word in count) print count[word], word}' | sort -rn -k1,1 -k2,2 | awk '{print $2}' | head -n "$k")

# Print the top-k words
echo "$word_counts"
