//
//  IdentificationSection.swift
//  Project Grib
//
//  Created by Tristan Beaton on 19/09/17.
//  Copyright © 2017 Tristan Beaton. All rights reserved.
//

import Foundation

class IdentificationSection {
    
    let length: UInt32
    let section: UInt8
    let centre: UInt16
    let subCentre: UInt16
    let masterTableVersion: UInt8
    let localTableCount: UInt8
    let significanceOfReferenceTime: UInt8
    let year: UInt16
    let month: UInt8
    let day: UInt8
    let hour: UInt8
    let minute: UInt8
    let second: UInt8
    let productionStatusOfProcessedData: UInt8
    let typeOfProcessedData: UInt8
    
    init(_ stream:GribFileStream, _ length: UInt32) throws {
        // Octets 1-4. Length of section in octets (21 or nn)
        self.length = length
        // Octet 5. Number of section (1)
        self.section = 1
        // Octets 6-7. Identification of originating/generating centre
        self.centre = try stream.readUI16()
        // Octets 8-9. Identification of originating/generating sub-centre
        self.subCentre = try stream.readUI16()
        // Octet 10. GRIB Master Tables Version Number
        self.masterTableVersion = try stream.readUI8()
        // Octet 11. Version number of GRIB Local Tables used to augment Master Tables
        self.localTableCount = try stream.readUI8()
        // Octet 12. Significance of Reference Time
        self.significanceOfReferenceTime = try stream.readUI8()
        // Octet 13-14. Year
        self.year = try stream.readUI16()
        // Octet 15. Month
        self.month = try stream.readUI8()
        // Octet 15. Day
        self.day = try stream.readUI8()
        // Octet 15. Hour
        self.hour = try stream.readUI8()
        // Octet 15. Minute
        self.minute = try stream.readUI8()
        // Octet 15. Second
        self.second = try stream.readUI8()
        // Octet 20. Production status of processed data in this GRIB message
        self.productionStatusOfProcessedData = try stream.readUI8()
        // Octet 21. Type of processed data in this GRIB message
        self.typeOfProcessedData = try stream.readUI8()
        // Octets 22-nn. Reserved: need not be present
        if self.length > 21 { try stream.skip(Int(length) - 21) }
    }
}
