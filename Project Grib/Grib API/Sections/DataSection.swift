//
//  DataSection.swift
//  Project Grib
//
//  Created by Tristan Beaton on 19/09/17.
//  Copyright © 2017 Tristan Beaton. All rights reserved.
//

import Foundation

class DataSection {
    
    let length: UInt32
    let section: UInt8
    
    init(_ stream:GribFileStream, _ length:UInt32, _ template:DataRepresentationTemplate) throws {
        // Octets 1-4. Length of section in octets
        self.length = length
        // Octet 5. Number of section (7)
        self.section = 7
        
        if let template = template as? Section5Template0 {
            // Prevents dividing by zero
            if template.bitsPerValue != 0 {
                // Y x 10D = R + X x 2E
                let refValue = Double(template.referenceValue) // R
                let binScale = Double(template.binaryScaleFactor) // E
                let decimalScale = Double(template.decimalScaleFactor) // D
                
                let ref = pow(10, decimalScale) * refValue
                let scale = pow(10, decimalScale) * pow(2, binScale)
                
                let dataCount = (Int(length) - 5) * 8 / Int(template.bitsPerValue)
                var data = Array(repeating: 0.0, count: dataCount)
                
                for i in 0 ..< dataCount {
                    data[i] = (ref + scale * Double(try stream.readBits(Int(template.bitsPerValue))))
                }
            }
        }
    }
}
