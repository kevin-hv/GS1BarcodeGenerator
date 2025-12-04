//
//  GenerateGS1BarcodeAsUIImage.swift
//  GS1BarcodeGenerator
//
//  Created by Kevin Varga on 30/11/2025.
//

#if canImport(UIKit)
import UIKit

public func generateGS1BarcodeUIImage(from: String, size: CGSize? = nil) throws -> UIImage {
    let imageAsBase64PNG = try generateGS1BarcodeAsPNGBase64EncodedString(from: from, size: size)
    let imageData = try imageDataFromBase64String(imageAsBase64PNG)
    
    guard let image = UIImage(data: imageData) else {
        throw BarcodeGeneratorError.couldNotTurnBase64EncodedStringToImageData
    }
    
    return image
}
#endif
