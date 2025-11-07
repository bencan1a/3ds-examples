# 3ds-examples

Examples for 3DS using devkitARM, libctru and citro3d

## Building

### Using Docker (Recommended)

You can build any example using the provided Docker build script:

```bash
./build-with-docker.sh <path-to-example>
```

For example, to build the hello-world example:

```bash
./build-with-docker.sh graphics/printing/hello-world
```

This will produce a `.3dsx` file that can be run on a Nintendo 3DS with homebrew capabilities. The output file will be copied to the `build-outputs/` folder in the repository for easy access.

### Using Native devkitARM

If you have devkitARM installed natively, you can build examples directly:

```bash
cd <path-to-example>
make
```

For example:

```bash
cd graphics/printing/hello-world
make
```

<p align="center"><a href="http://creativecommons.org/publicdomain/mark/1.0/"><img src="http://i.creativecommons.org/p/mark/1.0/88x31.png" alt="Public Domain Mark"></a></p>
