//
//  Section4Template0.swift
//  Project Grib
//
//  Created by Tristan Beaton on 20/09/17.
//  Copyright © 2017 Tristan Beaton. All rights reserved.
//

import Foundation

class Section4Template0 : Template {
    
    let parameterCategory: ParameterCategory
    let parameterNumber: Parameter
    let typeOfGeneratingProcess: UInt8
    let backgroundProcess: UInt8
    let generatingProcessIdentifier: UInt8
    let hoursAfterDataCutoff: UInt16
    let minutesAfterDataCutoff: UInt8
    let indicatorOfUnitOfTimeRange: UInt8
    let forecastTime: Int32
    let typeOfFirstFixedSurface: UInt8
    let scaleFactorOfFirstFixedSurface: Int8
    let scaledValueOfFirstFixedSurface: UInt32
    let typeOfSecondFixedSurface: UInt8
    let scaleFactorOfSecondFixedSurface: Int8
    let scaledValueOfSecondFixedSurface: UInt32
    
    enum ParameterCategory {
        case Temperature
        case Momentum
        case Mass
    }
    
    enum Parameter {
        case Temperature
        case uComponent
        case vComponent
        case PressureReducedMSL
    }
    
    init(_ stream:GribFileStream) throws {
        // Octet 10. Parameter category
        self.parameterCategory = try Section4Template0.parameterCategory(try stream.readUI8())
        // Octet 11. Parameter number
        self.parameterNumber = try Section4Template0.parameterNumber(try stream.readUI8(), self.parameterCategory)
        // Octet 12. Type of generating process
        self.typeOfGeneratingProcess = try stream.readUI8()
        // Octet 13. Background generating process identifier
        self.backgroundProcess = try stream.readUI8()
        // Octet 14. Analysis or forecast generating processes identifier
        self.generatingProcessIdentifier = try stream.readUI8()
        // Octets 15-16. Hours of observational data cutoff after reference time
        self.hoursAfterDataCutoff = try stream.readUI16()
        // Octet 17. Minutes of observational data cutoff after reference time
        self.minutesAfterDataCutoff = try stream.readUI8()
        // Octet 18. Indicator of unit of time range
        self.indicatorOfUnitOfTimeRange = try stream.readUI8()
        // Octets 19-22. Forecast time in units defined by octet 18
        self.forecastTime = try stream.readInt32()
        // Octet 23. Type of first fixed surface
        self.typeOfFirstFixedSurface = try stream.readUI8()
        // Octet 24. Scale factor of first fixed surface
        self.scaleFactorOfFirstFixedSurface = try stream.readInt8()
        // Octets 25-28. Scaled value of first fixed surface
        self.scaledValueOfFirstFixedSurface = try stream.readUI32()
        // Octet 29. Type of second fixed surface
        self.typeOfSecondFixedSurface = try stream.readUI8()
        // Octet 30. Scale factor of second fixed surface
        self.scaleFactorOfSecondFixedSurface = try stream.readInt8()
        // Octets 31-34. Scaled value of second fixed surface
        self.scaledValueOfSecondFixedSurface = try stream.readUI32()
    }
    
    private static func parameterCategory(_ value:UInt8) throws -> ParameterCategory {
        switch value {
            case 0: return .Temperature
            case 2: return .Momentum
            case 3: return .Mass
            default: throw GribFileStreamError.InvalidFile
        }
    }
    
    private static func parameterNumber(_ value:UInt8, _ category:ParameterCategory) throws -> Parameter {
        switch category {
        case .Temperature:
            switch value {
                case 0: return .Temperature
                default: throw GribFileStreamError.InvalidFile
            }
        case .Momentum:
            switch value {
                case 2: return .uComponent
                case 3: return .vComponent
                default: throw GribFileStreamError.InvalidFile
            }
        case .Mass:
            switch value {
                case 1: return .PressureReducedMSL
                default: throw GribFileStreamError.InvalidFile
            }
        default: throw GribFileStreamError.InvalidFile
        }
    }
}
