// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CronDescriptor",
    products: [
        .library(name: "CronDescriptor", targets: ["CronDescriptor"]),
    ],
    targets: [
        .target(name: "CronDescriptor"),
        .testTarget(name: "CronDescriptorTests", dependencies: ["CronDescriptor"]),
    ]
)
