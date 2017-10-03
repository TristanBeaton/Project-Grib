//
//  IndicatorSection.swift
//  Project Grib
//
//  Created by Tristan Beaton on 19/09/17.
//  Copyright © 2017 Tristan Beaton. All rights reserved.
//

import Foundation

class IndicatorSection {
    
    let disipline: String
    let edition: UInt8
    let length: UInt64
    
    init(_ stream:GribFileStream) throws {
        // Octets 1-4. GRIB" (coded according to the International Alphabet No. 5.)
        if try stream.moveToStart() {
            // Octets 5-6. Reserved
            let _ = try stream.skip(2)
            // Octet 7. Discipline
            self.disipline = try IndicatorSection.disipline(try stream.readUI8())
            // Octet 8. GRIB Edition Number (currently 2)
            self.edition = try stream.readUI8()
            // Octets 9-16. Total length of GRIB message in octets (including Section 0)
            self.length = try stream.readUI64()
            return
        }
        throw GribFileStreamError.InvalidFile
    }
    
    private static func disipline(_ value:UInt8) throws -> String {
        switch value {
            case 0: return "Meteorological"
            default: throw GribFileStreamError.Custom("Project Grib doesn't support this disipline: \(value)")
        }
    }
}
