#!/bin/bash

# Loop through all directories and find test_info.json files
for dir in ./*/; do
    # Check if test_info.json and a .png file exist in the directory
    if [ -f "$dir/test_info.json" ] && ls "$dir"/*.png 1>/dev/null 2>&1; then
        # Extract the name of the .png file (without path and extension)
        png_file=$(basename "$dir"/*.png)
        filename="${png_file%.*}"

        # Create the description string
        description="This is the description for site $filename"

        # Replace "TO_DO_ADD_DESCRIPTION" in test_info.json with the description string
        sed -i "s/TO_DO_ADD_DESCRIPTION/$description/g" "$dir/test_info.json"

        echo "Updated $dir/test_info.json with description: $description"
    fi
done

echo "Content update operation completed."
