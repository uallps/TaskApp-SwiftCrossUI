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
        .trait(name: "Prioridades", description: "Característica opcional: prioridad de la tarea"),
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
        // Vistas propias de cada versión: misma API pública, distinta implementación.
        // Se escriben cuando un framework no soporta algo que usa la otra versión.
        .target(name: "TaskViewsSwiftUI", dependencies: ["TaskCore"]),
        .target(
            name: "TaskViewsSwiftCrossUI",
            dependencies: [
                "TaskCore",
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
        // Fachada de interfaz: reexporta el framework y las vistas del trait elegido.
        .target(
            name: "TaskUI",
            dependencies: [
                .target(name: "TaskViewsSwiftUI", condition: .when(traits: ["SwiftUI"])),
                .target(name: "TaskViewsSwiftCrossUI", condition: .when(traits: ["SwiftCrossUI"])),
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
