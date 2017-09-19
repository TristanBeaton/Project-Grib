//
//  Section4CodeTable1.swift
//  Project Grib
//
//  Created by Tristan Beaton on 20/09/17.
//  Copyright © 2017 Tristan Beaton. All rights reserved.
//

import Foundation

enum Section4CodeTable1 {
    
    case Temperature
    case Moisture
    case Momentum
    case Mass
    case ShortwaveRadiation
    case LongwaveRadiation
    case Cloud
    case ThermodynamicStabilityIndices
    case KinematicStabilityIndices
    case TemperatureProbabilities
    case MoistureProbabilities
    case MomentumProbabilities
    case MassProbabilities
    case Aerosols
    case TraceGases
    case Radar
    case ForecastRadarImagery
    case Electrodynamics
    case NuclearRadiology
    case PhysicalAtmosphericProperties
    case CCITTIA5
    case Miscellaneous
    case Reserved
    case ReservedForLocalUse
    case Missing
    
    init(_ value:UInt8) {
        
        if value == 0 { self = .Temperature; return }
        
        if value == 1 { self = .Moisture; return }
        
        if value == 2 { self = .Momentum; return }
        
        if value == 3 { self = .Mass; return }
        
        if value == 4 { self = .ShortwaveRadiation; return }
        
        if value == 5 { self = .LongwaveRadiation; return }
        
        if value == 6 { self = .Cloud; return }
        
        if value == 7 { self = .ThermodynamicStabilityIndices; return }
        
        if value == 8 { self = .KinematicStabilityIndices; return }
        
        if value == 9 { self = .TemperatureProbabilities; return }
        
        if value == 10 { self = .MoistureProbabilities; return }
        
        if value == 11 { self = .MomentumProbabilities; return }
        
        if value == 12 { self = .MassProbabilities; return }
        
        if value == 13 { self = .Aerosols; return }
        
        if value == 14 { self = .TraceGases; return }
        
        if value == 15 { self = .Radar; return }
        
        if value == 16 { self = .ForecastRadarImagery; return }
        
        if value == 17 { self = .Electrodynamics; return }
        
        if value == 18 { self = .NuclearRadiology; return }
        
        if value == 19 { self = .PhysicalAtmosphericProperties; return }
        
        if value == 190 { self = .CCITTIA5; return }
        
        if value == 191 { self = .Miscellaneous; return }
        
        if value >= 192 && value <= 254 { self = .ReservedForLocalUse; return }
        
        if value == 255 { self = .Missing; return }
        
        self = .Reserved
    }
}
