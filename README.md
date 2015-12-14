# Packup

Scaffold out a Swift package.

## Installation

Build from source (requires [Swift 2.2 development toolchain](https://swift.org/download/#latest-development-snapshots)):

    make install

`packup` will be install at `/usr/local/bin/packup`.

Or download from the [Releases page](https://github.com/thii/packup/releases).

## Usage

    $ packup <YOUR_PACKAGE_NAME> <YOUR_GITHUB_USERNAME>

## Example

     $ packup MyPackage thii

A new directory named `MyPackage` with the following structure will be generated:

    MyPackage
    ├── LICENSE
    ├── Makefile
    ├── Package.swift
    ├── README.md
    └── Sources
        └── MyPackage.swift

## License
Packup is released under the MIT license. See LICENSE for details.
