//
//  GribMessage.swift
//  Project Grib
//
//  Created by Tristan Beaton on 19/09/17.
//  Copyright © 2017 Tristan Beaton. All rights reserved.
//

import Foundation

class GribMessage {
    
    private(set) var `is`: IndicatorSection!
    private(set) var ids: IdentificationSection!
    private(set) var loc: LocalUseSection?
    private(set) var gds: GridDefinitionSection!
    private(set) var pds: ProductDefinitionSection!
    private(set) var drs: DataRepresentationSection!
    private(set) var bitmap: BitmapSection!
    private(set) var data: DataSection!
    
    init(_ stream:GribFileStream) throws {
        // Read the Idicator Section
        self.is = try IndicatorSection(stream)
        
        while stream.hasBytesAvailable {
            // Get the next 4 octets. This is either the length of the next section, or "7777".
            let bytes = try stream.readUI8(4)
            // Convert bytes to String
            let str = String(bytes: bytes, encoding: .utf8)
            // Check if it is the end of the message
            if str == "7777" { break }
            // Otherwise, it must be the next sections length.
            let length: UInt32 = {
                let b = bytes.map { UInt32($0) }
                return b[0] << 24 | b[1] << 16 | b[2] << 8 | b[3]
            }()
            
            // Get the next section
            let section = try stream.readUI8()
            switch section {
                case 1:
                    // Read the Identification Section
                    self.ids = try IdentificationSection(stream, length)
                    continue
                case 2:
                    // Read the Local Use Section
                    self.loc = try LocalUseSection(stream, length)
                    continue
                case 3:
                    // Read the Grid Definition Section
                    self.gds = try GridDefinitionSection(stream, length)
                    continue
                case 4:
                    // Read the Product Definition Section
                    self.pds = try ProductDefinitionSection(stream, length)
                    continue
                case 5:
                    // Read the Data Representation Section
                    self.drs = try DataRepresentationSection(stream, length)
                    continue
                case 6:
                    // Read the Bit-Map Section
                    self.bitmap = try BitmapSection(stream, length)
                    continue
                case 7:
                    // Read the Date Section
                    self.data = try DataSection(stream, length, gds.template, drs.template)
                    continue
                default:
                    throw GribFileStreamError.InvalidSection(section)
            }
        }
        dump(self)
    }
}
