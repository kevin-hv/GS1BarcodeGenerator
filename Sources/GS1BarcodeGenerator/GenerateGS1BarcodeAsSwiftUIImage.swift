//
//  GenerateGS1BarcodeAsSwiftUIImage.swift
//  GS1BarcodeGenerator
//
//  Created by Kevin Varga on 30/11/2025.
//

#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public func generateGS1BarcodeImage(from: String, size: CGSize? = nil) throws -> Image {
    #if canImport(UIKit)
    let image = try generateGS1BarcodeUIImage(from: from, size: size)
    return Image(uiImage: image)
    #elseif canImport(Cocoa)
    let image = try generateGS1BarcodeNSImage(from: from, size: size)
    return Image(nsImage: image)
    #endif
    throw BarcodeGeneratorError.platformNotSupported
}
#endif
