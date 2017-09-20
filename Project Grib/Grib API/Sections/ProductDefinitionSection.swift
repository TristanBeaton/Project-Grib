//
//  ProductDefinitionSection.swift
//  Project Grib
//
//  Created by Tristan Beaton on 19/09/17.
//  Copyright © 2017 Tristan Beaton. All rights reserved.
//

import Foundation

class ProductDefinitionSection {
    
    let length: UInt32
    let section: UInt8
    let NV: UInt16
    let productDefinitionTemplateNumber: Section4CodeTable0
    let template: ProductDefinitionTemplate
    
    init(_ stream:GribFileStream, _ length:UInt32) throws {
        // Octets 1-4. Length of section in octets
        self.length = length
        // Octet 5. Number of section (4)
        self.section = 4
        // Octets 6-7. Number of coordinates values after Template
        self.NV = try stream.readUI16()
        // Octets 8-9. Product Definition Template Number
        self.productDefinitionTemplateNumber = Section4CodeTable0(try stream.readUI16())
        // Octets 10-nn. Product Definition Template
        self.template = try ProductDefinitionTemplate.template(stream, self.productDefinitionTemplateNumber)
    }
}
