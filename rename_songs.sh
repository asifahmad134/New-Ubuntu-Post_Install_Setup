#!/bin/bash

MAPPING_FILE="analyzed_songs.txt"
shopt -s nocaseglob

if [[ ! -f "$MAPPING_FILE" ]]; then
    echo "Error: $MAPPING_FILE not found."
    exit 1
fi

# Skip the header line and read the comma-separated year and song name
while IFS=',' read -r year song_name; do
    # Skip empty lines or the header
    [[ -z "$year" || "$year" == "Release Year" ]] && continue
    
    # Trim potential whitespace
    year=$(echo "$year" | xargs)
    song_name=$(echo "$song_name" | xargs)

    # The expected new filename
    new_name="$year - $song_name"

    # Match the existing file
    # We look for a file that matches the song_name exactly first
    if [[ -f "$song_name" ]]; then
        echo "Renaming: $song_name -> $new_name"
        mv -- "$song_name" "$new_name"
    elif [[ -f "$new_name" ]]; then
        echo "✅ Already correct: $new_name"
    else
        # Fuzzy match attempt for cases where the file might already have a different year
        # or slightly different punctuation
        clean_search=$(echo "$song_name" | sed -E 's/[^a-zA-Z0-9]//g' | tr '[:upper:]' '[:lower:]')
        
        match=""
        for f in *.mp4; do
            clean_file=$(echo "$f" | sed -E 's/^[0-9]{4} - //; s/[^a-zA-Z0-9]//g' | tr '[:upper:]' '[:lower:]')
            if [[ "$clean_file" == "$clean_search" ]]; then
                match="$f"
                break
            fi
        done

        if [[ -n "$match" ]]; then
             echo "Fuzzy Matched: $match -> $new_name"
             mv -- "$match" "$new_name"
        else
             echo "❌ No match found for: $song_name"
        fi
    fi

done < "$MAPPING_FILE"

echo "Process Complete."
