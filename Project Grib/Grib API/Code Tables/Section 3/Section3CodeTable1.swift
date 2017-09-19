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
        
        if value == 0 { self = .LatitudeLongitude; return }
        
        if value == 1 { self = .RotatedLatitudeLongitude; return }
        
        if value == 2 { self = .StretchedLatitudeLongitude; return }
        
        if value == 3 { self = .StretchedAndRotatedLatitudeLongitude; return }
        
        if value == 4 { self = .VariableResolutionLatitudeLongitude; return }
        
        if value == 5 { self = .VariableRotatedResolutionLatitudeLongitude; return }
        
        if value == 10 { self = .Mercator; return }
        
        if value == 20 { self = .PolarStereographic; return }
        
        if value == 30 { self = .LambertConformal; return }
        
        if value == 31 { self = .AlbersEqualArea; return }
        
        if value == 40 { self = .GaussianLatitudeLongitude; return }
        
        if value == 41 { self = .RotatedGaussianLatitudeLongitude; return }
        
        if value == 42 { self = .StretchedGaussianLatitudeLongitude; return }
        
        if value == 43 { self = .StretchedAndRotatedGaussianLatitudeLongitude; return }
        
        if value == 50 { self = .SphericalHarmonicCoefficients; return }
        
        if value == 51 { self = .RotatedSphericalHarmonicCoefficients; return }
        
        if value == 52 { self = .StretchedSphericalHarmonicCoefficients; return }
        
        if value == 53 { self = .StretchedAndRotatedSphericalHarmonicCoefficients; return }
        
        if value == 90 { self = .SpaceViewPerspectiveOrthographic; return }
        
        if value == 100 { self = .TriangularGridBasedOnAnIcosahedron; return }
        
        if value == 101 { self = .GeneralUnstructuredGrid; return }
        
        if value == 110 { self = .EquatorialAzimuthalEquidistantProjection; return }
        
        if value == 120 { self = .AzimuthRangeProjection; return }
        
        if value == 130 { self = .IrregularLatitudeLongitudeGrid; return }
        
        if value == 140 { self = .LambertAzimuthalEqualAreaProjection; return }
        
        if value == 1000 { self = .CrossSectionGrid; return }
        
        if value == 1100 { self = .HovmöllerDiagramGrid; return }
        
        if value == 1200 { self = .TimeSectionGrid; return }
        
        if value >= 32768 && value <= 65534 { self = .ReservedForLocalUse; return }
        
        if value == 65535 { self = .Missing; return }
        
        self = .Reserved
    }
}
