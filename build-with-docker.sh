#!/bin/bash
# Build script for 3DS examples using devkitPro Docker image
# Usage: ./build-with-docker.sh [path-to-example]
# Example: ./build-with-docker.sh graphics/printing/hello-world

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <path-to-example>"
    echo "Example: $0 graphics/printing/hello-world"
    exit 1
fi

EXAMPLE_PATH="$1"

if [ ! -d "$EXAMPLE_PATH" ]; then
    echo "Error: Directory '$EXAMPLE_PATH' does not exist"
    exit 1
fi

if [ ! -f "$EXAMPLE_PATH/Makefile" ]; then
    echo "Error: No Makefile found in '$EXAMPLE_PATH'"
    exit 1
fi

echo "Building example in: $EXAMPLE_PATH"
docker run --rm -v "$(pwd)/${EXAMPLE_PATH}":/project -w /project devkitpro/devkitarm make

# Create build-outputs directory if it doesn't exist
mkdir -p build-outputs

# Copy output files to build-outputs folder
EXAMPLE_NAME=$(basename "$EXAMPLE_PATH")
if ls "$EXAMPLE_PATH"/*.3dsx 1> /dev/null 2>&1; then
    cp -v "$EXAMPLE_PATH"/*.3dsx "build-outputs/${EXAMPLE_NAME}.3dsx"
    echo ""
    echo "Build complete! Output copied to: build-outputs/${EXAMPLE_NAME}.3dsx"
    ls -lh "build-outputs/${EXAMPLE_NAME}.3dsx"
else
    echo "No .3dsx files found"
fi
