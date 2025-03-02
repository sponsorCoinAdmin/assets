#!/bin/bash

# Find all wallet.json files in all subdirectories
find . -type f -path "*/wallet.json" 2>/dev/null | while read file; do
    # Use sed to replace lines containing "test-dummy-sites" with '"website": ""'
    sed -i '/test-dummy-sites/c\    "website": ""' "$file"
    echo "Updated: $file"
done

echo "Replacement completed."

