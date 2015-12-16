import Commander
import POSIX

let main = command() { (packageName: String, githubUsername: String) in
    try mkdir("./\(packageName)")

    // FIXME: Make a templates and generate files using input arguments

    // Write LICENSE file
    var licenseStrings = [
        "Copyright (c) 2015 \(githubUsername)",
        "",
        "Permission is hereby granted, free of charge, to any person obtaining a copy",
        "of this software and associated documentation files (the \"Software\"), to deal",
        "in the Software without restriction, including without limitation the rights",
        "to use, copy, modify, merge, publish, distribute, sublicense, and/or sell",
        "copies of the Software, and to permit persons to whom the Software is",
        "furnished to do so, subject to the following conditions:",
        "",
        "The above copyright notice and this permission notice shall be included in",
        "all copies or substantial portions of the Software.",
        "",
        "THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR",
        "IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,",
        "FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE",
        "AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER",
        "LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,",
        "OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN",
        "THE SOFTWARE.",
        "",
    ]
    let license = licenseStrings.joinWithSeparator("\n")
    try fputs(license, fopen("./\(packageName)/LICENSE", mode: "w"))

    // Write README.md file
    var readmeStrings = [String]()
    readmeStrings += [
        "# \(packageName) [![Swift Package Manager Compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-4BC51D.svg?style=flat)](https://github.com/apple/swift-package-manager)",
        "",
        "My awesome package.",
        "",
        "## Installation",
        "",
        "### Swift Package Manager",
        "",
        "\(packageName) is available via Swift Package Manager. To integrate \(packageName) into your package, add this as a dependency in your `Package.swift`:",
        "",
        "```swift",
        "import PackageDescription",
        "",
        "let package = Package(",
        "    name: \"MyPackage\",",
        "    dependencies: [",
        "        // Other dependencies",
        "        .Package(url: \"https://github.com/\(githubUsername)/\(packageName).git\", majorVersion: 1, minor: 0),",
        "    ]",
        ")",
        "```",
        "",
        "## License",
        "\(packageName) is released under the MIT license. See LICENSE for details.",
        "",
    ]
    let readme = readmeStrings.joinWithSeparator("\n")
    try fputs(readme, fopen("./\(packageName)/README.md", mode: "w"))

    // Write .gitignore file
    var gitignoreStrings = [
        "Packages/",
        ".build/",
        "",
    ]
    let gitignore = gitignoreStrings.joinWithSeparator("\n")
    try fputs(gitignore, fopen("./\(packageName)/.gitignore", mode: "w"))

    // Write Package.swift file
    var packageSwiftStrings = [
        "import PackageDescription",
        "",
        "let package = Package(",
        "    name: \"\(packageName)\",",
        "    dependencies: [",
        "    ]",
        ")",
        "",
    ]
    let packageSwift = packageSwiftStrings.joinWithSeparator("\n")
    try fputs(packageSwift, fopen("./\(packageName)/Package.swift", mode: "w"))

    // Write source file
    try mkdir("./\(packageName)/Sources")
    try fputs("", fopen("./\(packageName)/Sources/\(packageName).swift", mode: "w"))

    // Write Makefile file
    var makefileStrings = [
        ".PHONY: all clean",
        "",
        "all:",
        "\tswift build",
        "",
        "clean:",
        "\trm -rf Packages",
        "\tswift build --clean",
        "",
    ]

    let makefile = makefileStrings.joinWithSeparator("\n")
    try fputs(makefile, fopen("./\(packageName)/Makefile", mode: "w"))

    var editorconfigStrings = [
        "root = true",
        "",
        "[*]",
        "indent_style = space",
        "indent_size = 4",
        "end_of_line = lf",
        "charset = utf-8",
        "trim_trailing_whitespace = true",
        "insert_final_newline = true",
        "",
        "[*.md]",
        "trim_trailing_whitespace = false",
        "",
    ]
    let editorconfig = editorconfigStrings.joinWithSeparator("\n")
    try fputs(editorconfig, fopen("./\(packageName)/.editorconfig", mode: "w"))
}

main.run()
