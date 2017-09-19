//
//  Section4CodeTable0.swift
//  Project Grib
//
//  Created by Tristan Beaton on 19/09/17.
//  Copyright © 2017 Tristan Beaton. All rights reserved.
//

import Foundation

enum Section4CodeTable0 : Template {
    
    case AnalysisOrForecastAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime
    case IndividualEnsembleForecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime
    case DerivedForecastsBasedOnAllEnsembleMembersAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime
    case DerivedForecastsBasedOnAClusterOfEnsembleMembersOverARectangularAreaAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime
    case DerivedForecastsBasedOnAClusterOfEnsembleMembersOverACircularAreaAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime
    case ProbabilityForecastsAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime
    case PercentileForecastsAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime
    case AnalysisOrForecastErrorAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime
    case AverageAccumulationExtremeValuesOrOtherStatisticallyProcessedValuesAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousTimeInterval
    case ProbabilityForecastsAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousTimeInterval
    case PercentileForecastsAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousTimeInterval
    case IndividualEnsembleForecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousInterval
    case DerivedForecastsBasedOnAllEnsembleMembersAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousInterval
    case DerivedForecastsBasedOnAClusterOfEnsembleMembersOverARectangularAreaAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousInterval
    case DerivedForecastsBasedOnAClusterOfEnsembleMembersOverACircularAreaAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousInterval
    case AverageAccumulationExtremeValuesOrOtherStatisticallyProcessedValuesOverASpatialAreaAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime
    case RadarProduct
    case SatelliteProductDeprecated
    case SatelliteProduct
    case AnalysisOrForecastAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTimeForSimulatedSyntheticSatelliteData
    case IndividualEnsembleForecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTimeForSimulatedSatelliteData
    case IndividualEnsembleForecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousIntervalForSimulatedSyntheticSatelliteData
    case AnalysisOrForecastAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTimeForAtmosphericChemicalConstituents
    case IndividualEnsembleForecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTimeForAtmosphericChemicalConstituents
    case AverageAccumulationAndOrExtremeValuesOrOtherStatisticallyProcessedValuesAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousTimeIntervalForAtmosphericChemicalConstituents
    case IndividualEnsembleForecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousTimeIntervalForAtmosphericChemicalConstituents
    case AerosolAnalysisOrForecastAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime
    case AerosolIndividualEnsembleForecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime
    case AerosolAverageAccumulationAndOrExtremeValuesOrOtherStatisticallyProcessedValuesAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousTimeInterval
    case AerosolIndividualEnsembleForecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousTimeIntervalForAerosol
    case AnalysisOrForecastOfAMultiComponentParameterOrMatrixElementAtAPointInTimeValidation
    case CategoricalForecastsAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime
    case PartitionedParametersAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime
    case IndividualEnsembleForecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTimeForPartitionedParameters
    case IndividualEnsembleReforecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime
    case IndividualEnsembleReforecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousTimeInterval
    case CategoricalForecastsAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousTimeInterval
    case CCITTIA5CharacterString
    case CrossSectionOfAnalysisAndForecastAtAPointInTime
    case CrossSectionOfAveragedOrOtherwiseStatisticallyProcessedAnalysisOrForecastOverARangeOfTime
    case CrossSectionOfAnalysisAndForecastAveragedOrOtherwiseStatisticallyProcessedOverLatitudeOrLongitude
    case HovmoellerTypeGridWithNoAveragingOrOtherStatisticalProcessing
    case HovmoellerTypeGridWithAveragingOrOtherStatisticalProcessing
    case AnalysisOrForecastAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTimeForOpticalPropertiesOfAerosol
    case Reserved
    case ReservedForLocalUse
    case Missing
    
    init(_ value:UInt16) {
        
        if value == 0 { self = .AnalysisOrForecastAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime; return }
        
        if value == 1 { self = .IndividualEnsembleForecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime; return }
        
        if value == 2 { self = .DerivedForecastsBasedOnAllEnsembleMembersAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime; return }
        
        if value == 3 { self = .DerivedForecastsBasedOnAClusterOfEnsembleMembersOverARectangularAreaAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime; return }
        
        if value == 4 { self = .DerivedForecastsBasedOnAClusterOfEnsembleMembersOverACircularAreaAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime; return }
        
        if value == 5 { self = .ProbabilityForecastsAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime; return }
        
        if value == 6 { self = .PercentileForecastsAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime; return }
        
        if value == 7 { self = .AnalysisOrForecastErrorAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime; return }
        
        if value == 8 { self = .AverageAccumulationExtremeValuesOrOtherStatisticallyProcessedValuesAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousTimeInterval; return }
        
        if value == 9 { self = .ProbabilityForecastsAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousTimeInterval; return }
        
        if value == 10 { self = .PercentileForecastsAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousTimeInterval; return }
        
        if value == 11 { self = .IndividualEnsembleForecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousInterval; return }
        
        if value == 12 { self = .DerivedForecastsBasedOnAllEnsembleMembersAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousInterval; return }
        
        if value == 13 { self = .DerivedForecastsBasedOnAClusterOfEnsembleMembersOverARectangularAreaAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousInterval; return }
        
        if value == 14 { self = .DerivedForecastsBasedOnAClusterOfEnsembleMembersOverACircularAreaAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousInterval; return }
        
        if value == 15 { self = .AverageAccumulationExtremeValuesOrOtherStatisticallyProcessedValuesOverASpatialAreaAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime; return }
        
        if value == 20 { self = .RadarProduct; return }
        
        if value == 30 { self = .SatelliteProductDeprecated; return }
        
        if value == 31 { self = .SatelliteProduct; return }
        
        if value == 32 { self = .AnalysisOrForecastAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTimeForSimulatedSyntheticSatelliteData; return }
        
        if value == 33 { self = .IndividualEnsembleForecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTimeForSimulatedSatelliteData; return }
        
        if value == 34 { self = .IndividualEnsembleForecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousIntervalForSimulatedSyntheticSatelliteData; return }
        
        if value == 40 { self = .AnalysisOrForecastAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTimeForAtmosphericChemicalConstituents; return }
        
        if value == 41 { self = .IndividualEnsembleForecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTimeForAtmosphericChemicalConstituents; return }
        
        if value == 42 { self = .AverageAccumulationAndOrExtremeValuesOrOtherStatisticallyProcessedValuesAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousTimeIntervalForAtmosphericChemicalConstituents; return }
        
        if value == 43 { self = .IndividualEnsembleForecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousTimeIntervalForAtmosphericChemicalConstituents; return }
        
        if value == 44 { self = .AerosolAnalysisOrForecastAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime; return }
        
        if value == 45 { self = .AerosolIndividualEnsembleForecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime; return }
        
        if value == 46 { self = .AerosolAverageAccumulationAndOrExtremeValuesOrOtherStatisticallyProcessedValuesAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousTimeInterval; return }
        
        if value == 47 { self = .AerosolIndividualEnsembleForecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousTimeIntervalForAerosol; return }
        
        if value == 50 { self = .AnalysisOrForecastOfAMultiComponentParameterOrMatrixElementAtAPointInTimeValidation; return }
        
        if value == 51 { self = .CategoricalForecastsAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime; return }
        
        if value == 53 { self = .PartitionedParametersAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime; return }
        
        if value == 54 { self = .IndividualEnsembleForecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTimeForPartitionedParameters; return }
        
        if value == 60 { self = .IndividualEnsembleReforecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime; return }
        
        if value == 61 { self = .IndividualEnsembleReforecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousTimeInterval; return }
        
        if value == 91 { self = .CategoricalForecastsAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousTimeInterval; return }
        
        if value == 254 { self = .CCITTIA5CharacterString; return }
        
        if value == 1000 { self = .CrossSectionOfAnalysisAndForecastAtAPointInTime; return }
        
        if value == 1001 { self = .CrossSectionOfAveragedOrOtherwiseStatisticallyProcessedAnalysisOrForecastOverARangeOfTime; return }
        
        if value == 1002 { self = .CrossSectionOfAnalysisAndForecastAveragedOrOtherwiseStatisticallyProcessedOverLatitudeOrLongitude; return }
        
        if value == 1100 { self = .HovmoellerTypeGridWithNoAveragingOrOtherStatisticalProcessing; return }
        
        if value == 1101 { self = .HovmoellerTypeGridWithAveragingOrOtherStatisticalProcessing; return }
        
        if value >= 32768 && value <= 65534 { self = .ReservedForLocalUse; return }
        
        if value == 65535 { self = .Missing; return }
        
        self = .Reserved
    }
}
