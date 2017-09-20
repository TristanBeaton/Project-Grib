//
//  DataRepresentationTemplate.swift
//  Project Grib
//
//  Created by Tristan Beaton on 20/09/17.
//  Copyright © 2017 Tristan Beaton. All rights reserved.
//

import Foundation

class DataRepresentationTemplate {
    
    static func template(_ stream:GribFileStream, _ type:Section5CodeTable0) throws -> DataRepresentationTemplate {
        switch type {
        case .GridPointDataSimplePacking:
            return try Section5Template0(stream)
        default:
            throw GribFileStreamError.UnsupportedTemplate(type)
        }
    }
}
