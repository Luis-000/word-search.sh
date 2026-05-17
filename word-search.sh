#!/usr/bin/env bash

# This Script searches words from names.txt (Just practicing)
# It then saves the matching words into a found-words.txt file

echo "		
			--- Instructions ---
	'^' Before the letter for words that start with the letter;
	'$' After the letter for words that end with the letter;
	"
echo "Enter a letter to search in names.txt (): "
read letter

# echo "Chosen letter: $letter"

echo "------------"

if [[ $letter == ^* ]]; then
	echo "Searching for all the words that start with '${letter:1}'..."
elif [[ $letter == *$ ]]; then
	echo "Searching for all the words that end with '${letter:0:-1}'..."
else
	echo "Searching for all the words with a '$letter' in them..."
fi
echo "------------"

i=0

		echo "" >> found-words.txt
		echo "--------- $(date '+%Y/%m/%d %H:%M:%S') ---------" >> found-words.txt
		echo "" >> found-words.txt



while read -r word; do
	echo "$word" 
	echo "$word" >> found-words.txt

	((i++))
done < <(grep -i "$letter" names.txt)

if [[ $i == 0  ]]; then
	echo "No words were found!"
	echo "No Matches" >> found-words.txt
else
	echo "Found $i Words"
fi

sleep 1
