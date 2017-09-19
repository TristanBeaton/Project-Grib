//
//  Section5Template.swift
//  Project Grib
//
//  Created by Tristan Beaton on 19/09/17.
//  Copyright © 2017 Tristan Beaton. All rights reserved.
//

import Foundation

class GridDefinitionTemplate: Template {
    
    static func template(_ stream:GribFileStream, _ type:Section3CodeTable1) throws -> GridDefinitionTemplate {
        
        switch type {
            
        case .LatitudeLongitude:
            
            return try Section3Template0(stream)
            
        default:
            
            throw GribFileStreamError.UnsupportedTemplate(type)
        }
    }
}
