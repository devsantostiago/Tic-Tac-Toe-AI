// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Tic-Tac-Toe-AI",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Tic-Tac-Toe-AI",
            targets: ["Tic-Tac-Toe-AI"]),
    ],
    dependencies: [
        .package(name: "Tic-Tac-Toe-Engine",
                 url: "https://github.com/devsantostiago/Tic-Tac-Toe-Game-Engine.git",
                 .branch("master")
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Tic-Tac-Toe-AI",
            dependencies: ["Tic-Tac-Toe-Engine"]),
        .testTarget(
            name: "Tic-Tac-Toe-AITests",
            dependencies: ["Tic-Tac-Toe-AI", "Tic-Tac-Toe-Engine"]),
    ]
)
