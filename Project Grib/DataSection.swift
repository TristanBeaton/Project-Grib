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
    
    init(_ stream:GribFileStream, _ length:UInt32) throws {
        
        // Octets 1-4. Length of section in octets
        self.length = length
        
        // Octet 5. Number of section (7)
        self.section = 7
        
        
        try stream.skip(Int(self.length) - 5)
    }
}
