#!/bin/bash

for file in */test_info.json; do
    # Check if the file exists
    if [[ -f "$file" ]]; then
        # Use sed to replace the URL in the polygonscan line with "https://polygonscan.com/address/NA"
        sed -i 's|\"https://sepolia.etherscan.io/address/.*\"|\"https://sepolia.etherscan.io/address/NA\"|g' "$file"
        echo "Updated: $file"
    fi
done
