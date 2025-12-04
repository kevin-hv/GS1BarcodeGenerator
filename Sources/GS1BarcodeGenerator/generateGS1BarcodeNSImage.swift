//
//  GenerateGS1BarcodeAsNSImage.swift
//  GS1BarcodeGenerator
//
//  Created by Kevin Varga on 30/11/2025.
//

#if canImport(Cocoa)
import Cocoa

public func generateGS1BarcodeNSImage(from: String, size: CGSize? = nil) throws -> NSImage {
    let imageAsBase64PNG = try generateGS1BarcodeAsPNGBase64EncodedString(from: from, size: size)
    let imageData = try imageDataFromBase64String(imageAsBase64PNG)
    
    guard let image = NSImage(data: imageData) else {
        throw BarcodeGeneratorError.couldNotTurnBase64EncodedStringToImageData
    }
    
    return image
}
#endif
