//
//  Section5CodeTable0.swift
//  Project Grib
//
//  Created by Tristan Beaton on 20/09/17.
//  Copyright © 2017 Tristan Beaton. All rights reserved.
//

import Foundation

enum Section5CodeTable0 {
    case GridPointDataSimplePacking
    case MatrixValueSimplePacking
    case GridPointDataComplexPacking
    case GridPointDataComplexPackingAndSpatialDifferencing
    case GridPointDataIEEEFloatingPointData
    case GridPointDataJPEG2000CodeStreamFormat
    case GridPointDataPortableNetworkGraphics
    case GridPointAndSpectralDataCCSDS
    case SpectralDataSimplePacking
    case SphericalHarmonicsDataComplexPacking
    case GridPointDataSimplePackingWithLogarithmPreprocessing
    case RunLengthPackingWithLevelValues
    case Reserved
    case ReservedForLocalUse
    case Missing
    
    init(_ value:UInt16) {
        switch value {
            case 0: self = .GridPointDataSimplePacking
            case 1: self = .MatrixValueSimplePacking
            case 2: self = .GridPointDataComplexPacking
            case 3: self = .GridPointDataComplexPackingAndSpatialDifferencing
            case 4: self = .GridPointDataIEEEFloatingPointData
            case 40: self = .GridPointDataJPEG2000CodeStreamFormat
            case 41: self = .GridPointDataPortableNetworkGraphics
            case 42: self = .GridPointAndSpectralDataCCSDS
            case 50: self = .SpectralDataSimplePacking
            case 51: self = .SphericalHarmonicsDataComplexPacking
            case 61: self = .GridPointDataSimplePackingWithLogarithmPreprocessing
            case 200: self = .RunLengthPackingWithLevelValues
            case 65535: self = .Missing
            default: if value >= 49152 && value <= 65534 { self = .ReservedForLocalUse } else { self = .Reserved }
        }
    }
}
