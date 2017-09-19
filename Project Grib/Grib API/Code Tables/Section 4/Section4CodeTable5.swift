//
//  Section4CodeTable5.swift
//  Project Grib
//
//  Created by Tristan Beaton on 20/09/17.
//  Copyright © 2017 Tristan Beaton. All rights reserved.
//

import Foundation

enum Section4CodeTable5 {
    
    case GroundOrWaterSurface
    case CloudBaseLevel
    case LevelOfCloudTops
    case LevelOf0CIsotherm
    case LevelOfAdiabaticCondensationLiftedFromTheSurface
    case MaximumWindLevel
    case Tropopause
    case NominalTopOfTheAtmosphere
    case SeaBottom
    case EntireAtmosphere
    case CumulonimbusBase
    case CumulonimbusTop
    case IsothermalLevel
    case IsobaricSurface
    case MeanSeaLevel
    case SpecificAltitudeAboveMeanSeaLevel
    case SpecifiedHeightLevelAboveGround
    case SigmaLevel
    case HybridLevel
    case DepthBelowLandSurface
    case IsentropicLevel
    case LevelAtSpecifiedPressureDifferenceFromGroundToLevel
    case PotentialVorticitySurface
    case EtaLevel
    case LogarithmicHybridLevel
    case SnowLevel
    case MixedLayerDepth
    case HybridHeightLevel
    case HybridPressureLevel
    case GeneralizedVerticalHeightCoordinate
    case DepthBelowSeaLevel
    case DepthBelowWaterSurface
    case LakeOrRiverBottom
    case BottomOfSedimentLayer
    case BottomOfThermallyActiveSedimentLayer
    case BottomOfSedimentLayerPenetratedByThermalWave
    case MixingLayer
    case BottomOfRootZone
    case Reserved
    case ReservedForLocalUse
    case Missing
    
    init(_ value:UInt8) {
        
        if value == 1 { self = .GroundOrWaterSurface; return }
        
        if value == 2 { self = .CloudBaseLevel; return }
        
        if value == 3 { self = .LevelOfCloudTops; return }
        
        if value == 4 { self = .LevelOf0CIsotherm; return }
        
        if value == 5 { self = .LevelOfAdiabaticCondensationLiftedFromTheSurface; return }
        
        if value == 6 { self = .MaximumWindLevel; return }
        
        if value == 7 { self = .Tropopause; return }
        
        if value == 8 { self = .NominalTopOfTheAtmosphere; return }
        
        if value == 9 { self = .SeaBottom; return }
        
        if value == 10 { self = .EntireAtmosphere; return }
        
        if value == 11 { self = .CumulonimbusBase; return }
        
        if value == 12 { self = .CumulonimbusTop; return }
        
        if value == 20 { self = .IsothermalLevel; return }
        
        if value == 100 { self = .IsobaricSurface; return }
        
        if value == 101 { self = .MeanSeaLevel; return }
        
        if value == 102 { self = .SpecificAltitudeAboveMeanSeaLevel; return }
        
        if value == 103 { self = .SpecifiedHeightLevelAboveGround; return }
        
        if value == 104 { self = .SigmaLevel; return }
        
        if value == 105 { self = .HybridLevel; return }
        
        if value == 106 { self = .DepthBelowLandSurface; return }
        
        if value == 107 { self = .IsentropicLevel; return }
        
        if value == 108 { self = .LevelAtSpecifiedPressureDifferenceFromGroundToLevel; return }
        
        if value == 109 { self = .PotentialVorticitySurface; return }
        
        if value == 111 { self = .EtaLevel; return }
        
        if value == 113 { self = .LogarithmicHybridLevel; return }
        
        if value == 114 { self = .SnowLevel; return }
        
        if value == 117 { self = .MixedLayerDepth; return }
        
        if value == 118 { self = .HybridHeightLevel; return }
        
        if value == 119 { self = .HybridPressureLevel; return }
        
        if value == 150 { self = .GeneralizedVerticalHeightCoordinate; return }
        
        if value == 160 { self = .DepthBelowSeaLevel; return }
        
        if value == 161 { self = .DepthBelowWaterSurface; return }
        
        if value == 162 { self = .LakeOrRiverBottom; return }
        
        if value == 163 { self = .BottomOfSedimentLayer; return }
        
        if value == 164 { self = .BottomOfThermallyActiveSedimentLayer; return }
        
        if value == 165 { self = .BottomOfSedimentLayerPenetratedByThermalWave; return }
        
        if value == 166 { self = .MixingLayer; return }
        
        if value == 167 { self = .BottomOfRootZone; return }
        
        if value >= 192 && value <= 254 { self = .ReservedForLocalUse; return }
        
        if value == 255 { self = .Missing; return }
        
        self = .Reserved
    }
}
