//
//  Section3CodeTable0.swift
//  Project Grib
//
//  Created by Tristan Beaton on 19/09/17.
//  Copyright © 2017 Tristan Beaton. All rights reserved.
//

import Foundation

enum Section3CodeTable0 {
    
    case Section3CodeTable1
    
    case OriginatingCentre
    
    case Reserved
    
    case ReservedForLocalUse
    
    case NotApplicable
    
    init(_ value:UInt8) {
        
        if value == 0 { self = .Section3CodeTable1; return }
        
        if value == 1 { self = .OriginatingCentre; return }
        
        if value >= 2 && value <= 191 { self = .Reserved; return }
        
        if value >= 192 && value <= 254 { self = .ReservedForLocalUse; return }
        
        self = .NotApplicable
    }
}
