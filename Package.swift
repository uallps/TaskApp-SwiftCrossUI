// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "TaskApp",
    platforms: [.macOS(.v14)],
    products: [
        .executable(name: "TaskApp", targets: ["TaskApp"]),
    ],
    targets: [
        .executableTarget(name: "TaskApp"),
    ],
    swiftLanguageModes: [.v6]
)
