//
//  Section3CodeTable11.swift
//  Project Grib
//
//  Created by Tristan Beaton on 19/09/17.
//  Copyright © 2017 Tristan Beaton. All rights reserved.
//

import Foundation

enum Section3CodeTable11 {
    
    case None
    
    case Parallels
    
    case ExtremeCoordinateValues
    
    case Latitudes
    
    case Reserved
    
    case Missing
    
    init(_ value:UInt8) {
        
        if value == 0 { self = .None; return }
        
        if value == 1 { self = .Parallels; return }
        
        if value == 2 { self = .ExtremeCoordinateValues; return }
        
        if value == 3 { self = .Latitudes; return }
        
        if value >= 4 && value <= 254 { self = .Reserved; return }
        
        self = .Missing
    }
}
