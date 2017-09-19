//
//  ProductDefinitionTemplate.swift
//  Project Grib
//
//  Created by Tristan Beaton on 20/09/17.
//  Copyright © 2017 Tristan Beaton. All rights reserved.
//

import Foundation

class ProductDefinitionTemplate {
    
    static func template(_ stream:GribFileStream, _ type:Section4CodeTable0) throws -> ProductDefinitionTemplate {
        
        switch type {
            
        case .AnalysisOrForecastAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime:
            
            return try Section4Template0(stream)
            
        default:
            
            throw GribFileStreamError.UnsupportedTemplate(type)
        }
    }
}
