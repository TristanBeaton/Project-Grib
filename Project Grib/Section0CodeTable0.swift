//
//  Section0CodeTable0.swift
//  Project Grib
//
//  Created by Tristan Beaton on 19/09/17.
//  Copyright © 2017 Tristan Beaton. All rights reserved.
//

import Foundation

enum Section0CodeTable0 {
    
    case Meteorological
    
    case Hydrological
    
    case LandSurface
    
    case Space
    
    case Oceanographic
    
    case Reserved
    
    case ReservedForLocalUse
    
    case Missing
    
    init(_ value:UInt8) {
        
        if value == 0 { self = .Meteorological; return }
        
        if value == 1 { self = .Hydrological; return }
        
        if value == 2 { self = .LandSurface; return }
        
        if value == 3 { self = .Space; return }
        
        if value >= 4 && value <= 9 { self = .Reserved; return }
        
        if value == 10 { self = .Oceanographic; return }
        
        if value >= 11 && value <= 191 { self = .Reserved; return }
        
        if value >= 192 && value <= 254 { self = .ReservedForLocalUse; return }
        
        self = .Missing
    }
}
