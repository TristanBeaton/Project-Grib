//
//  Section1CodeTable1.swift
//  Project Grib
//
//  Created by Tristan Beaton on 19/09/17.
//  Copyright © 2017 Tristan Beaton. All rights reserved.
//

import Foundation

enum Section1CodeTable1 {

    case LocalTablesNotUsed
    
    case LocalTablesCount(UInt8)
    
    case Missing
    
    init(_ value:UInt8) {
        
        if value == 0 { self = .LocalTablesNotUsed; return }
        
        if value == 255 { self = .Missing; return }
        
        self = .LocalTablesCount(value)
    }
}
