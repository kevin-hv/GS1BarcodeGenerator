//
//  Created on 30/11/2025.
//  
//  Copyright Kevin Varga. All Rights Reserved.
//

import Foundation
import Gs1barcodegen

public enum BarcodeGeneratorError : Error {
    case couldNotTurnBase64EncodedStringToImageData
    case platformNotSupported
    case underlyingGeneratorError(Error)
}

public func generateGS1BarcodeAsPNGBase64EncodedString(from: String, size: CGSize? = nil) throws -> String {
    var nsError: NSError? = nil
    
    let size = size ?? .init()
    
    let result = Gs1barcodegenGenerateGS1BarcodeIntoBase64EncodedPNG(from, Int(size.width), Int(size.height), &nsError)
    
    if let nsError {
        throw BarcodeGeneratorError.underlyingGeneratorError(nsError)
    }
    
    return result
}

func imageDataFromBase64String(_ base64String: String) throws -> Data {
    let cleanedString = base64String
        .replacingOccurrences(of: "data:image/png;base64,", with: "")

    guard let imageData = Data(base64Encoded: cleanedString, options: .ignoreUnknownCharacters) else {
        throw BarcodeGeneratorError.couldNotTurnBase64EncodedStringToImageData
    }
    
    return imageData
}
