//
//  GribInterpreter.swift
//  Project Grib
//
//  Created by Tristan Beaton on 5/10/17.
//  Copyright © 2017 Tristan Beaton. All rights reserved.
//

import Foundation

class GribInterpreter {
    
    let message: GribMessage
    
    init(message: GribMessage) {
        self.message = message
    }
    
    func encode() -> String {
        // Storage
        var header = Dictionary<String,Any>()
        var data = Array<Any>()
        
        // MARK: Indicator Section
        header["disipline"] = Section0CodeTable0(message.is.disipline)
        header["grib_edtion"] = message.is.edition
        header["grib_length"] = message.is.length
        
        // MARK: Identification Section
        header["center"] = message.ids.centre
        header["centerName"] = CommonCodeTableC11(message.ids.centre)
        
        
        // MARK: Grid Definition Section
        if let template = message.gds.template as? Section3Template0 {
            header["first_latitude"] = template.latitudeOfFirstGridPoint
            header["first_longitude"] = template.longitudeOfFirstGridPoint
            header["last_latitude"] = template.latitudeOfLastGridPoint
            header["last_longitude"] = template.longitudeOfLastGridPoint
            header["latitude_grid_count"] = template.Nj
            header["longitude_grid_count"] = template.Ni
        }
        
        // MARK: Product Definition Section
        if let template = message.pds.template as? Section4Template0 {
            let parameter = Section4CodeTable2(template.parameterCategory, template.parameterNumber)
            header["parameter_number"] = template.parameterNumber
            header["parameter_name"] = parameter.name
            header["parameter_unit"] = parameter.unit
            
            if template.typeOfFirstFixedSurface != 255 {
                let firstSurface = Section4CodeTable5(template.typeOfFirstFixedSurface)
                header["first_surface_number"] = template.typeOfFirstFixedSurface
                header["first_surface_name"] = firstSurface.name
                header["first_surface_unit"] = firstSurface.unit
                header["first_surface_value"] = (template.scaleFactorOfFirstFixedSurface == 0 ? Double(template.scaledValueOfFirstFixedSurface) : Double(template.scaledValueOfFirstFixedSurface) * Double(template.scaleFactorOfFirstFixedSurface))
            }
            
            if template.typeOfSecondFixedSurface != 255 {
                let secondSurface = Section4CodeTable5(template.typeOfSecondFixedSurface)
                header["second_surface_number"] = template.typeOfSecondFixedSurface
                header["second_surface_name"] = secondSurface.name
                header["second_surface_unit"] = secondSurface.unit
                header["second_surface_value"] = (template.scaleFactorOfSecondFixedSurface == 0 ? Double(template.scaledValueOfSecondFixedSurface) : Double(template.scaledValueOfSecondFixedSurface) * Double(template.scaleFactorOfSecondFixedSurface))
            }
        }
        
        header["number_of_values"] = message.drs.numberOfValues
        data = message.data.data
        
        guard
            let json = try? JSONSerialization.data(withJSONObject: ["header":header,"data":data], options: .prettyPrinted),
            let str = String(data: json, encoding: .utf8)
        else { return "Invalid JSON"}
        
        return str
    }
    
    private func Section0CodeTable0(_ value:UInt8) -> String {
        switch value {
            case 0: return "Meteorological products"
            case 1: return "Hydrological products"
            case 2: return "Land surface products"
            case 3: return "Space products"
            case 10: return "Oceanographic products"
            case 255: return "Missing"
            default: return "Reserved"
        }
    }
    
    private func CommonCodeTableC11(_ value:UInt16) -> String? {
        switch value {
            case 7: return "US National Weather Service, National Centres for Environmental Prediction (NCEP)"
            case 8: return "US National Weather Service Telecommunications Gateway (NWSTG)"
            default: return nil
        }
    }
    
    private func Section4CodeTable2(_ category:UInt8, _ number:UInt8) -> (name:String?, unit:String?) {
        switch category {
        case 0:
            switch number {
                case 0: return ("Temperature", "K")
                case 1: return ("Virtual temperature", "K")
                case 2: return ("Potential temperature", "K")
                case 3: return ("Pseudo-adiabatic potential temperature or equivalent potential temperature", "K")
                case 4: return ("Maximum temperature", "K")
                case 5: return ("Minimum temperature", "K")
                case 6: return ("Dew point temperature", "K")
                case 7: return ("Dew point depression (or deficit)", "K")
                case 8: return ("Lapse rate", "K m-1")
                case 9: return ("Temperature anomaly", "K")
                case 10: return ("Latent heat net flux", "W m-2")
                case 11: return ("Sensible heat net flux", "W m-2")
                case 12: return ("Heat index", "K")
                case 13: return ("Wind chill factor", "K")
                case 14: return ("Minimum dew point depression", "K")
                case 15: return ("Virtual potential temperature", "K")
                case 16: return ("Snow phase change heat flux", "W m-2")
                default: return ("Missing", nil)
            }
        case 2:
            switch number {
                case 0: return ("Wind direction", "T")
                case 1: return ("Wind speed", "m s-1")
                case 2: return ("u-component of wind", "m s-1")
                case 3: return ("v-component of wind", "m s-1")
                case 4: return ("Stream function", "m2 s-1")
                case 5: return ("Velocity potential", "m2 s-1")
                case 6: return ("Montgomery stream function", "m2 s-1")
                case 7: return ("Sigma coordinate vertical velocity", "s-1")
                case 8: return ("Vertical velocity (pressure)", "Pa s-1")
                case 9: return ("Vertical velocity (geometric)", "m s-1")
                case 10: return ("Absolute vorticity", "s-1")
                case 11: return ("Absolute divergence", "s-1")
                case 12: return ("Relative vorticity", "s-1")
                case 13: return ("Relative divergence", "s-1")
                case 14: return ("Potential vorticity", "K m2 kg-1 s-1")
                case 15: return ("Vertical u-component shear", "s-1")
                case 16: return ("Vertical v-component shear", "s-1")
                case 17: return ("Momentum flux, u component", "N m-2")
                case 18: return ("Momentum flux, v component", "N m-2")
                case 19: return ("Wind mixing energy", "J")
                case 20: return ("Boundary layer dissipation", "W m-2")
                case 21: return ("Maximum wind speed", "m s-1")
                case 22: return ("Wind speed (gust)", "m s-1")
                case 23: return ("u-component of wind (gust)", "m s-1")
                case 24: return ("v-component of wind (gust)", "m s-1")
                case 25: return ("Vertical speed shear", "s-1")
                case 26: return ("Horizontal momentum flux", "N m-2")
                case 27: return ("u-component storm motion", "m s-1")
                case 28: return ("v-component storm motion", "m s-1")
                case 29: return ("Drag coefficient", "Numeric")
                case 30: return ("Frictional velocity", "m s-1")
                default: return (nil, nil)
            }
        case 3:
            switch number {
                case 0: return ("Pressure", "Pa")
                case 1: return ("Pressure reduced to MSL", "Pa")
                case 2: return ("Pressure tendency", "Pa s-1")
                case 3: return ("ICAO Standard Atmosphere Reference Height", "m")
                case 4: return ("Geopotential", "m2 s-2")
                case 5: return ("Geopotential height", "gpm")
                case 6: return ("Geometric height", "m")
                case 7: return ("Standard deviation of height", "m")
                case 8: return ("Pressure anomaly", "Pa")
                case 9: return ("Geopotential height anomaly", "gpm")
                case 10: return ("Density", "kg m-3")
                case 11: return ("Altimeter setting", "Pa")
                case 12: return ("Thickness", "m")
                case 13: return ("Pressure altitude", "m")
                case 14: return ("Density altitude", "m")
                case 15: return ("5-wave geopotential height", "gpm")
                case 16: return ("Zonal flux of gravity wave stress", "N m-2")
                case 17: return ("Meridional flux of gravity wave stress", "N m-2")
                case 18: return ("Planetary boundary layer height", "m")
                case 19: return ("5-wave geopotential height anomaly", "gpm")
                default: return (nil, nil)
            }
        default: return (nil, nil)
        }
    }
    
    private func Section4CodeTable5(_ value:UInt8) -> (name:String?, unit:String?) {
        switch value {
            case 1: return ("Ground or water surface", nil)
            case 2: return ("Cloud base level", nil)
            case 3: return ("Level of cloud tops", nil)
            case 4: return ("Level of 0o C isotherm", nil)
            case 5: return ("Level of adiabatic condensation lifted from the surface", nil)
            case 6: return ("Maximum wind level", nil)
            case 7: return ("Tropopause", nil)
            case 8: return ("Nominal top of the atmosphere", nil)
            case 9: return ("Sea bottom", nil)
            case 10: return ("Entire atmosphere", nil)
            case 11: return ("Cumulonimbus (CB) base", "m")
            case 12: return ("Cumulonimbus (CB) top", "m")
            case 20: return ("Isothermal level", "K")
            case 100: return ("Isobaric surface", "Pa")
            case 101: return ("Mean sea level", nil)
            case 102: return ("Specific altitude above mean sea level", "m")
            case 103: return ("Specified height level above ground", "m")
            case 104: return ("Sigma level", nil)
            case 105: return ("Hybrid level", nil)
            case 106: return ("Depth below land surface", "m")
            case 107: return ("Isentropic (theta) level", "K")
            case 108: return ("Level at specified pressure difference from ground to level", "Pa")
            case 109: return ("Potential vorticity surface", "K m2 kg-1 s-1")
            case 111: return ("Eta level", nil)
            case 113: return ("Logarithmic hybrid level", nil)
            case 114: return ("Snow level", nil)
            case 117: return ("Mixed layer depth", "m")
            case 118: return ("Hybrid height level", nil)
            case 119: return ("Hybrid pressure level", nil)
            case 150: return ("Generalized vertical height coordinate", nil)
            case 160: return ("Depth below sea level", "m")
            case 161: return ("Depth below water surface", "m")
            case 162: return ("Lake or river bottom", nil)
            case 163: return ("Bottom of sediment layer", nil)
            case 164: return ("Bottom of thermally active sediment layer", nil)
            case 165: return ("Bottom of sediment layer penetrated by thermal wave", nil)
            case 166: return ("Mixing layer", nil)
            case 167: return ("Bottom of root zone", nil)
            default: return (nil, nil)
        }
    }
}
