import PackageDescription

let package = Package(
    name: "packup",
    dependencies: [
        .Package(url: "https://github.com/kylef/Commander.git", majorVersion: 0, minor: 4),
        .Package(url: "https://github.com/apple/swift-package-manager.git", majorVersion: 0, minor: 1),
    ]
)
