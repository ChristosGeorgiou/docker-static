#!/bin/sh

# Path to your HTML template as the first argument
DIST_DIR="$1"

echo "Reading HTML templates from $DIST_DIR/*.html"

# Find HTML files and process them
find "$DIST_DIR" -type f -name '*.html' | while IFS= read -r file; do
    echo "Processing file: $file"
    perl -pi -e 's/\$\{([a-zA-Z_][a-zA-Z_0-9]*)\}/$ENV{$1}/ge' "$file"
done

# Check if a command is provided to execute afterwards
if [ -z "$2" ]; then
    echo "No command specified to execute after processing."
else
    echo "Executing command: ${@:2}" # This executes from the second argument onwards
    exec "${@:2}" # Correctly execute the command passed as arguments starting from the second one
fi
