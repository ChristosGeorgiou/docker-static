#!/bin/sh

# Path to your HTML template as the first argument
DIST_DIR="$1"

while IFS= read -r -d '' file; do
  # Check if the file is an HTML file
  if [[ $file == *".html" ]]; then

    TEMP_FILE=$(mktemp)

    trap "rm -f $TEMP_FILE" EXIT

    # Output file
    OUTPUT=$file

    # Read each line in the HTML template
    while IFS= read -r line; do
        # Look for placeholders and replace them with environment variable values
        echo "$line" | sed -e "s/\${\([a-zA-Z_][a-zA-Z_0-9]*\)}/\$(printf '%s' \"\$\1\")/ge" >> $TEMP_FILE
    done < "$TEMPLATE"

    # Write the modified content to the output file
    mv $TEMP_FILE $OUTPUT

  fi
done < <(find $DIST_DIR -type f -print0)
