#!/bin/bash

echo "Validating legacy programs..."

FILES=$(find export_from_legacy -name "*.pgm")

for file in $FILES
do
    echo "Checking $file"

    if grep -q "PROGRAM" "$file"; then
        echo "Program header found"
    else
        echo "WARNING: Missing PROGRAM header"
    fi
done

echo "Validation complete."
