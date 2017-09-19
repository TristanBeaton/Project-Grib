//
//  Section4CodeTable3.swift
//  Project Grib
//
//  Created by Tristan Beaton on 20/09/17.
//  Copyright © 2017 Tristan Beaton. All rights reserved.
//

import Foundation

enum Section4CodeTable3 {
    
    case Analysis
    case Initialization
    case Forecast
    case BiasCorrectedForecast
    case EnsembleForecast
    case ProbabilityForecast
    case ForecastError
    case AnalysisError
    case Observation
    case Climatological
    case ProbabilityWeightedForecast
    case BiasCorrectedEnsembleForecast
    case PostProcessedAnalysis
    case PostProcessedForecast
    case Nowcast
    case Hindcast
    case Reserved
    case ReservedForLocalUse
    case Missing
    
    init(_ value:UInt8) {
        
        if value == 0 { self = .Analysis; return }
        
        if value == 1 { self = .Initialization; return }
        
        if value == 2 { self = .Forecast; return }
        
        if value == 3 { self = .BiasCorrectedForecast; return }
        
        if value == 4 { self = .EnsembleForecast; return }
        
        if value == 5 { self = .ProbabilityForecast; return }
        
        if value == 6 { self = .ForecastError; return }
        
        if value == 7 { self = .AnalysisError; return }
        
        if value == 8 { self = .Observation; return }
        
        if value == 9 { self = .Climatological; return }
        
        if value == 10 { self = .ProbabilityWeightedForecast; return }
        
        if value == 11 { self = .BiasCorrectedEnsembleForecast; return }
        
        if value == 12 { self = .PostProcessedAnalysis; return }
        
        if value == 13 { self = .PostProcessedForecast; return }
        
        if value == 14 { self = .Nowcast; return }
        
        if value == 15 { self = .Hindcast; return }
        
        if value >= 192 && value <= 254 { self = .ReservedForLocalUse; return }
        
        if value == 255 { self = .Missing; return }
        
        self = .Reserved
    }
}
