#!/bin/bash

# Check if the parameter was passed
if [ -z "$1" ]; then
  echo "Error: Please specify a file name (without extension) as a parameter."
  echo "Example: ./transform.sh catalog"
  exit 1
fi

# Define paths to files
NAME="$1"
XML_FILE="${NAME}.xml"
XSL_FILE="${NAME}.xsl"
OUTPUT_DIR="output"
OUTPUT_FILE="${OUTPUT_DIR}/${NAME}.html"

# Check for the existence of XML and XSL
if [ ! -f "$XML_FILE" ]; then
  echo "Error: File '$XML_FILE' not found."
  exit 1
fi

if [ ! -f "$XSL_FILE" ]; then
  echo "Error: File '$XSL_FILE' not found."
  exit 1
fi

# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# start transformation
echo "Transformation: $XML_FILE + $XSL_FILE -> $OUTPUT_FILE"
java -jar ../target/net.clojars.mirsait/xslt-cli-0.1.0-SNAPSHOT.jar "$XML_FILE" "$XSL_FILE" "$OUTPUT_FILE"

# Check if the execution was successful
if [ $? -eq 0 ]; then
    echo "Success! Result in $OUTPUT_FILE"
else
    echo "Error while executing XSLT transformation."
    exit 1
fi