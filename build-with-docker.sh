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

echo ""
echo "Build complete! Output files:"
ls -lh "$EXAMPLE_PATH"/*.3dsx 2>/dev/null || echo "No .3dsx files found"
