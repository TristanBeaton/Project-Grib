//
//  Section4CodeTable4.swift
//  Project Grib
//
//  Created by Tristan Beaton on 20/09/17.
//  Copyright © 2017 Tristan Beaton. All rights reserved.
//

import Foundation

enum Section4CodeTable4 {
    
    case Minute
    case Hour
    case Day
    case Month
    case Year
    case Decade
    case Normal
    case Century
    case ThreeHours
    case SixHours
    case TwelveHours
    case Second
    case Reserved
    case ReservedForLocalUse
    case Missing
    
    init(_ value:UInt8) {
        // TODO Change this init method to a switch
        if value == 0 { self = .Minute; return }
        if value == 1 { self = .Hour; return }
        if value == 2 { self = .Day; return }
        if value == 3 { self = .Month; return }
        if value == 4 { self = .Year; return }
        if value == 5 { self = .Decade; return }
        if value == 6 { self = .Normal; return }
        if value == 7 { self = .Century; return }
        if value == 10 { self = .ThreeHours; return }
        if value == 11 { self = .SixHours; return }
        if value == 12 { self = .TwelveHours; return }
        if value == 13 { self = .Second; return }
        if value >= 192 && value <= 254 { self = .ReservedForLocalUse; return }
        if value == 255 { self = .Missing; return }
        self = .Reserved
    }
}
