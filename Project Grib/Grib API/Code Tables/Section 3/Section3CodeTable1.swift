//
//  Section3CodeTable1.swift
//  Project Grib
//
//  Created by Tristan Beaton on 19/09/17.
//  Copyright © 2017 Tristan Beaton. All rights reserved.
//

import Foundation

enum Section3CodeTable1 : Template {
    case LatitudeLongitude
    case RotatedLatitudeLongitude
    case StretchedLatitudeLongitude
    case StretchedAndRotatedLatitudeLongitude
    case VariableResolutionLatitudeLongitude
    case VariableRotatedResolutionLatitudeLongitude
    case Mercator
    case PolarStereographic
    case LambertConformal
    case AlbersEqualArea
    case GaussianLatitudeLongitude
    case RotatedGaussianLatitudeLongitude
    case StretchedGaussianLatitudeLongitude
    case StretchedAndRotatedGaussianLatitudeLongitude
    case SphericalHarmonicCoefficients
    case RotatedSphericalHarmonicCoefficients
    case StretchedSphericalHarmonicCoefficients
    case StretchedAndRotatedSphericalHarmonicCoefficients
    case SpaceViewPerspectiveOrthographic
    case TriangularGridBasedOnAnIcosahedron
    case GeneralUnstructuredGrid
    case EquatorialAzimuthalEquidistantProjection
    case AzimuthRangeProjection
    case IrregularLatitudeLongitudeGrid
    case LambertAzimuthalEqualAreaProjection
    case CrossSectionGrid
    case HovmöllerDiagramGrid
    case TimeSectionGrid
    case Reserved
    case ReservedForLocalUse
    case Missing
    
    init(_ value:UInt16) {
        switch value {
            case 0: self = .LatitudeLongitude
            case 1: self = .RotatedLatitudeLongitude
            case 2: self = .StretchedLatitudeLongitude
            case 3: self = .StretchedAndRotatedLatitudeLongitude
            case 4: self = .VariableResolutionLatitudeLongitude
            case 5: self = .VariableRotatedResolutionLatitudeLongitude
            case 10: self = .Mercator
            case 20: self = .PolarStereographic
            case 30: self = .LambertConformal
            case 31: self = .AlbersEqualArea
            case 40: self = .GaussianLatitudeLongitude
            case 41: self = .RotatedGaussianLatitudeLongitude
            case 42: self = .StretchedGaussianLatitudeLongitude
            case 43: self = .StretchedAndRotatedGaussianLatitudeLongitude
            case 50: self = .SphericalHarmonicCoefficients
            case 51: self = .RotatedSphericalHarmonicCoefficients
            case 52: self = .StretchedSphericalHarmonicCoefficients
            case 53: self = .StretchedAndRotatedSphericalHarmonicCoefficients
            case 90: self = .SpaceViewPerspectiveOrthographic
            case 100: self = .TriangularGridBasedOnAnIcosahedron
            case 101: self = .GeneralUnstructuredGrid
            case 110: self = .EquatorialAzimuthalEquidistantProjection
            case 120: self = .AzimuthRangeProjection
            case 130: self = .IrregularLatitudeLongitudeGrid
            case 140: self = .LambertAzimuthalEqualAreaProjection
            case 1000: self = .CrossSectionGrid
            case 1100: self = .HovmöllerDiagramGrid
            case 1200: self = .TimeSectionGrid
            case 65535: self = .Missing
            default : if value >= 32768 && value <= 65534 { self = .ReservedForLocalUse } else { self = .Reserved }
        }
    }
}
