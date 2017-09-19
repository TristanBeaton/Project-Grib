//
//  LocalUseSection.swift
//  Project Grib
//
//  Created by Tristan Beaton on 19/09/17.
//  Copyright © 2017 Tristan Beaton. All rights reserved.
//

import Foundation

class LocalUseSection {
    
    let length: UInt32
    
    let section: UInt8
    
    init(_ stream:GribFileStream, _ length:UInt32) throws {
        
        // Octets 1-4. Length of section in octets
        self.length = length
        
        // Octet 5. Number of section (2)
        self.section = 2
        
        // Octet 6-nn. Local use
        if self.length > 5 {
            
            try stream.skip(Int(self.length) - 5)
        }
    }
}
