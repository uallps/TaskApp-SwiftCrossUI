// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "TaskApp",
    platforms: [.macOS(.v14), .iOS(.v17)],
    products: [
        .executable(name: "TaskApp", targets: ["TaskApp"]),
    ],
    // Cada trait es una variante de producto: qué framework de interfaz se compila.
    traits: [
        .trait(name: "SwiftUI", description: "Producto con SwiftUI (solo Apple)"),
        .trait(name: "SwiftCrossUI", description: "Producto con SwiftCrossUI"),
        .default(enabledTraits: ["SwiftUI"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/moreSwift/swift-cross-ui.git",
            .upToNextMinor(from: "0.10.0")
        ),
    ],
    targets: [
        // Modelo y ViewModel: Swift puro, común a todos los productos.
        .target(name: "TaskCore"),
        // Fachada de interfaz: reexporta el framework elegido por el trait.
        .target(
            name: "TaskUI",
            dependencies: [
                .product(
                    name: "SwiftCrossUI",
                    package: "swift-cross-ui",
                    condition: .when(traits: ["SwiftCrossUI"])
                ),
                .product(
                    name: "DefaultBackend",
                    package: "swift-cross-ui",
                    condition: .when(traits: ["SwiftCrossUI"])
                ),
            ]
        ),
        .executableTarget(
            name: "TaskApp",
            dependencies: ["TaskCore", "TaskUI"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
