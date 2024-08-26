#!/bin/bash

# Define the list of images
images=(
    "gcr.io/disearch/vertexai-citation:dev-f875882745ba003160120cc222d40dcffe13a579"
    "gcr.io/disearch/vertex-ai-summary:dev-b681f3506e4d82aa69bb8c35449430d9de4a5b15"
    "gcr.io/disearch/disearch:latest"
    "gcr.io/disearch/doc_chat:dev-34b31c6b2c328d53b4b5f3e5d65e66276b98eb73"
    "gcr.io/disearch/vertex-ai-followup:latest"
    "gcr.io/disearch/disearch-vertexai:latest"
)

# File to store the output
output_file="output.txt"

# Run trivy image command for each image and append the output to the file
for image in "${images[@]}"; do
    echo "Scanning image: $image" >> "$output_file"
    trivy image "$image" >> "$output_file" 2>&1
    echo "----------------------------------------" >> "$output_file"
done
