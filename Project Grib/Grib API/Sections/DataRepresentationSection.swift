//
//  DataRepresentationSection.swift
//  Project Grib
//
//  Created by Tristan Beaton on 19/09/17.
//  Copyright © 2017 Tristan Beaton. All rights reserved.
//

import Foundation

class DataRepresentationSection {
    
    let length: UInt32
    let section: UInt8
    let numberOfValues: UInt32
    let dataRepresentationTemplateNumber: Section5CodeTable0
    let template: DataRepresentationTemplate
    
    init(_ stream:GribFileStream, _ length:UInt32) throws {
        // Octets 1-4. Length of section in octets
        self.length = length
        // Octet 5. Number of section (5)
        self.section = 5
        // Octets 6-9. Number of data points where one or more values are specified in Section 7 when a bit map is present, total number of data points when a bit map is absent.
        self.numberOfValues = try stream.readUI32()
        // Octets 10-11. Data Representation Template Number
        self.dataRepresentationTemplateNumber = Section5CodeTable0(try stream.readUI16())
        // Octets 12-nn. Data Representation Template
        self.template = try DataRepresentationTemplate.template(stream, self.dataRepresentationTemplateNumber)
    }
}
