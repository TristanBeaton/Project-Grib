//
//  GridDefinitionSection.swift
//  Project Grib
//
//  Created by Tristan Beaton on 19/09/17.
//  Copyright © 2017 Tristan Beaton. All rights reserved.
//

import Foundation

class GridDefinitionSection {
    
    let length: UInt32
    let section: UInt8
    let sourceOfGridDefinition: Section3CodeTable0
    let numberOfDataPoints: UInt32
    let numberOfOctectsForNumberOfPoints: UInt8
    let interpretationOfNumberOfPoints: Section3CodeTable11
    let gridDefinitionTemplateNumber: Section3CodeTable1
    let gridDefinitionTemplate: GridDefinitionTemplate

    init(_ stream:GribFileStream, _ length:UInt32) throws {
        // Octets 1-4. Length of section in octets
        self.length = length
        // Octet 5. Number of section (3)
        self.section = 3
        // Octet 6. 
        self.sourceOfGridDefinition = Section3CodeTable0(try stream.readUI8())
        // Octets 7-10.
        self.numberOfDataPoints = try stream.readUI32()
        // Octet 11.
        self.numberOfOctectsForNumberOfPoints = try stream.readUI8()
        // Octet 12.
        self.interpretationOfNumberOfPoints = Section3CodeTable11(try stream.readUI8())
        // Octets 13-14.
        self.gridDefinitionTemplateNumber = Section3CodeTable1(try stream.readUI16())
        // Octets 15-xx. Grid Definition Template.
        self.gridDefinitionTemplate = try GridDefinitionTemplate.template(stream, self.gridDefinitionTemplateNumber)
    }
}
