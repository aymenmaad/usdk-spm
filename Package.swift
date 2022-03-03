// swift-tools-version:5.4

import PackageDescription

let packageUrl = "https://sightcall-ios-cocoapods.s3.amazonaws.com/universalSDK"
let packageVersion = "3.9.0.alpha.1"

let package = Package(
    name: "USDK",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "LSUniversalSDK",
            type: .dynamic,
            targets: ["LSUniversalSDKWrapper"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/AFNetworking/AFNetworking.git", .upToNextMajor(from: "4.0.0")),
        .package(url: "https://github.com/iziz/libPhoneNumber-iOS.git", .upToNextMajor(from: "0.9.0")),
        .package(url: "https://github.com/Kireyin/SVGgh.git", .branch("master")),
    ],
    targets: [
        .binaryTarget(name: "LSUniversalSDK",
                      url: "\(packageUrl)/\(packageVersion)/LSUniversalSDK.xcframework.zip",
                      checksum: "b4f987a34df5da51e8df6cc59c4b9dbfeb02ec90aee434c2b7c1839552bdaaa3"),
        .binaryTarget(name: "LiveTranslation",
                      url: "\(packageUrl)/\(packageVersion)/LiveTranslation.xcframework.zip",
                      checksum: "8aa079fd3e7b6dfd2877ec918edc9ccc12fe491bb8d145d1a0c2b57c942e9f34"),
        .binaryTarget(name: "MediaCapture",
                      url: "\(packageUrl)/\(packageVersion)/MediaCapture.xcframework.zip",
                      checksum: "fe53af89129c67ba74324718f06f5b0364283784c24aec509d8db273ae9a32be"),
        .binaryTarget(name: "AdvancedAnnotations",
                      url: "\(packageUrl)/\(packageVersion)/AdvancedAnnotations.xcframework.zip",
                      checksum: "23f98d1dc3c205804c71c1838a1ae0f2768f9b04a1d123970ea11c64e13422fd"),
        .binaryTarget(name: "Multiparty",
                      url: "\(packageUrl)/\(packageVersion)/Multiparty.xcframework.zip",
                      checksum: "48ae046ea1710d8b26263b05051d369a46e848316150b89de68930de4ea52f27"),
        .binaryTarget(name: "SCWormhole",
                      url: "\(packageUrl)/\(packageVersion)/SCWormhole.xcframework.zip",
                      checksum: "40293b2d7daab65103047e982f084ee916b80f5e5b0370a32375d82d90a860e2"),
        .binaryTarget(name: "Permissions",
                      url: "\(packageUrl)/\(packageVersion)/Permissions.xcframework.zip",
                      checksum: "111ba67d740c653d570b6fce3b24619e8d16f91df944077d282040f11bc7d68e"),
        .target(name: "LSUniversalSDKWrapper",
                dependencies: [
                    .target(name: "LSUniversalSDK"),
                    .target(name: "LiveTranslation"),
                    .target(name: "MediaCaptureWrapper"),
                    .target(name: "AdvancedAnnotationsWrapper"),
                    .target(name: "Multiparty"),
                    .target(name: "SCWormhole"),
                    .product(name: "AFNetworking", package: "AFNetworking"),
                    .product(name: "libPhoneNumber", package: "libPhoneNumber-iOS")
                ],
               path: "LSUniversalSDKWrapper"),
        .target(name: "MediaCaptureWrapper",
                dependencies: [
                    .target(name: "MediaCapture"),
                    .target(name: "Permissions")
                ],
                path: "MediaCaptureWrapper"),
        .target(name: "AdvancedAnnotationsWrapper",
                dependencies: [
                    .target(name: "AdvancedAnnotations"),
                    .product(name: "SVGgh", package: "SVGgh")
                ],
               path: "AdvancedAnnotationsWrapper")
    ]
)
