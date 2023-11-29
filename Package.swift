// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import class Foundation.ProcessInfo

let localPackagesDir = ProcessInfo.processInfo.environment["LOCAL_PACKAGES_DIR"] ?? ""

func makeBinaryTarget(name: String, checksum: String) -> PackageDescription.Target {
    localPackagesDir.isEmpty
        ? .binaryTarget(name: name, url: "https://github.com/ser-0xff/ordo-frameworks/blob/main/\(name).xcframework.zip", checksum: checksum)
        : .binaryTarget(name: name, path: "\(name).xcframework.zip")
}

let package = Package(
    name: "ordo-frameworks",
    platforms: [
        .macOS(.v14),
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "Frostflake",
            targets: ["Frostflake-debug"]
        )
    ],
    targets: [
        .target(
            name: "Dummy"
        ),
        makeBinaryTarget(name: "Frostflake-debug", checksum: "faaa312589f2b29454e3f5238ffa5aaaab7eedcbcad8e68b8c5eff30e7b58972"),
        makeBinaryTarget(name: "Frostflake-release", checksum: "bb838ac916888dcb4de952072a6a3a86cb2c28073e14ff9bcac0d85571a7dac9")
    ]
)
