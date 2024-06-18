#!/bin/bash

# Check if a file path is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <file_path>"
  exit 1
fi

file_path=$1

# Check if the file exists
if [ ! -f "$file_path" ]; then
  echo "File not found!"
  exit 1
fi

# Function to clean directory names
clean_name() {
  echo "$1" | tr -d '\r' | tr -c '[:alnum:]' '_'
}

# Read the file line by line
while IFS= read -r line || [ -n "$line" ]; do
  # Remove spaces, carriage returns, and split the line into words
  IFS=' ' read -r -a words <<< "$(echo $line | tr -d '\r')"
  
  # Check if there are words in the line
  if [ ${#words[@]} -eq 0 ]; then
    continue
  fi

  # First word is the parent directory
  parent_dir=$(clean_name "${words[0]}")
  
  # Create the parent directory
  mkdir -p "$parent_dir"
  
  # Create subdirectories inside the parent directory
  for ((i=1; i<${#words[@]}; i++)); do
    sub_dir=$(clean_name "${words[i]}")
    mkdir -p "$parent_dir/$sub_dir"
  done

done < "$file_path"
