#!/bin/bash

input_file="$1"
output_file="$2"

json_objects=$(jq '. | length' "$input_file")

html=""
for ((i=0; i<$json_objects; i++)); do
    keys=$(jq "keys[]" ".[$i]" "$input_file")
    for key in $keys; do
        value=$(jq -r ".[$i].$key" "$input_file")
        html+="<h1>$key: $value</h1>"
    done
done

echo "$html" > "$output_file"

