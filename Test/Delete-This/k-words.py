import sys
import string

# Check that 2 arguments are given
if len(sys.argv) != 3:
    print("Usage: python3 get_top_words.py <text_file> <k>")
    sys.exit(1)

# Assign arguments to variables
text_file = sys.argv[1]
k = int(sys.argv[2])

# Check that text file exists
try:
    with open(text_file, 'r') as f:
        pass
except FileNotFoundError:
    print(f"Error: File {text_file} not found.")
    sys.exit(1)

# Read stopwords into a set
stopwords_file = "stopwords"
try:
    with open(stopwords_file, 'r') as f:
        stopwords = set(f.read().splitlines())
except FileNotFoundError:
    print(f"Error: File {stopwords_file} not found.")
    sys.exit(1)

# Count the frequency of each word and sort alphabetically
word_counts = {}
with open(text_file, 'r') as f:
    for line in f:
        for word in line.strip().lower().split():
            word = word.translate(str.maketrans('', '', string.punctuation))
            if word and word not in stopwords:
                word_counts[word] = word_counts.get(word, 0) + 1
# Sort the words by frequency (highest to lowest) and alphabetically if there's a tie
top_words = sorted(word_counts.keys(), key=lambda w: (-word_counts[w], w))[:k]

# Print the top-k words
for word in top_words:
    print(word)

