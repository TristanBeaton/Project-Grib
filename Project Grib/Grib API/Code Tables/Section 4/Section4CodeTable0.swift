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
        switch value {
            case 0: self = .AnalysisOrForecastAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime
            case 1: self = .IndividualEnsembleForecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime
            case 2: self = .DerivedForecastsBasedOnAllEnsembleMembersAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime
            case 3: self = .DerivedForecastsBasedOnAClusterOfEnsembleMembersOverARectangularAreaAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime
            case 4: self = .DerivedForecastsBasedOnAClusterOfEnsembleMembersOverACircularAreaAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime
            case 5: self = .ProbabilityForecastsAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime
            case 6: self = .PercentileForecastsAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime
            case 7: self = .AnalysisOrForecastErrorAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime
            case 8: self = .AverageAccumulationExtremeValuesOrOtherStatisticallyProcessedValuesAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousTimeInterval
            case 9: self = .ProbabilityForecastsAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousTimeInterval
            case 10: self = .PercentileForecastsAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousTimeInterval
            case 11: self = .IndividualEnsembleForecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousInterval
            case 12: self = .DerivedForecastsBasedOnAllEnsembleMembersAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousInterval
            case 13: self = .DerivedForecastsBasedOnAClusterOfEnsembleMembersOverARectangularAreaAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousInterval
            case 14: self = .DerivedForecastsBasedOnAClusterOfEnsembleMembersOverACircularAreaAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousInterval
            case 15: self = .AverageAccumulationExtremeValuesOrOtherStatisticallyProcessedValuesOverASpatialAreaAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime
            case 20: self = .RadarProduct
            case 30: self = .SatelliteProductDeprecated
            case 31: self = .SatelliteProduct
            case 32: self = .AnalysisOrForecastAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTimeForSimulatedSyntheticSatelliteData
            case 33: self = .IndividualEnsembleForecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTimeForSimulatedSatelliteData
            case 34: self = .IndividualEnsembleForecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousIntervalForSimulatedSyntheticSatelliteData
            case 40: self = .AnalysisOrForecastAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTimeForAtmosphericChemicalConstituents
            case 41: self = .IndividualEnsembleForecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTimeForAtmosphericChemicalConstituents
            case 42: self = .AverageAccumulationAndOrExtremeValuesOrOtherStatisticallyProcessedValuesAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousTimeIntervalForAtmosphericChemicalConstituents
            case 43: self = .IndividualEnsembleForecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousTimeIntervalForAtmosphericChemicalConstituents
            case 44: self = .AerosolAnalysisOrForecastAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime
            case 45: self = .AerosolIndividualEnsembleForecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime
            case 46: self = .AerosolAverageAccumulationAndOrExtremeValuesOrOtherStatisticallyProcessedValuesAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousTimeInterval
            case 47: self = .AerosolIndividualEnsembleForecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousTimeIntervalForAerosol
            case 50: self = .AnalysisOrForecastOfAMultiComponentParameterOrMatrixElementAtAPointInTimeValidation
            case 51: self = .CategoricalForecastsAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime
            case 53: self = .PartitionedParametersAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime
            case 54: self = .IndividualEnsembleForecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTimeForPartitionedParameters
            case 60: self = .IndividualEnsembleReforecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerAtAPointInTime
            case 61: self = .IndividualEnsembleReforecastControlAndPerturbedAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousTimeInterval
            case 91: self = .CategoricalForecastsAtAHorizontalLevelOrInAHorizontalLayerInAContinuousOrNonContinuousTimeInterval
            case 254: self = .CCITTIA5CharacterString
            case 1000: self = .CrossSectionOfAnalysisAndForecastAtAPointInTime
            case 1001: self = .CrossSectionOfAveragedOrOtherwiseStatisticallyProcessedAnalysisOrForecastOverARangeOfTime
            case 1002: self = .CrossSectionOfAnalysisAndForecastAveragedOrOtherwiseStatisticallyProcessedOverLatitudeOrLongitude
            case 1100: self = .HovmoellerTypeGridWithNoAveragingOrOtherStatisticalProcessing
            case 1101: self = .HovmoellerTypeGridWithAveragingOrOtherStatisticalProcessing
            case 65535: self = .Missing
            default: if value >= 32768 && value <= 65534 { self = .ReservedForLocalUse } else { self = .Reserved }
        }
    }
}
