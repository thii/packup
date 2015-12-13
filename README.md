# Packup [![Swift Package Manager Compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-4BC51D.svg?style=flat)](https://github.com/apple/swift-package-manager)

Scaffold out a Swift package.

## Installation

Build from source (requires Swift 2.2 development toolchain):

    make install

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
