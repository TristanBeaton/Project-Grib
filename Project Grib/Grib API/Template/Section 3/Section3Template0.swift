//
//  Section3Template0.swift
//  Project Grib
//
//  Created by Tristan Beaton on 19/09/17.
//  Copyright © 2017 Tristan Beaton. All rights reserved.
//

import Foundation

class Section3Template0 : Template {
    
    let shapeOfTheEarth: UInt8
    let scaleFactorOfRadiusOfSphericalEarth: UInt8
    let scaledValueOfRadiusOfSphericalEarth: UInt32
    let scaleFactorOfEarthMajorAxis: UInt8
    let scaledValueOfEarthMajorAxis: UInt32
    let scaleFactorOfEarthMinorAxis: UInt8
    let scaledValueOfEarthMinorAxis: UInt32
    let Ni: UInt32
    let Nj: UInt32
    let basicAngleOfTheInitialProductionDomain: Double
    let subdivisionsOfBasicAngle: UInt32
    let latitudeOfFirstGridPoint: Double
    let longitudeOfFirstGridPoint: Double
    let resolutionAndComponentFlags: Array<ResolutionComponentFlags>
    let latitudeOfLastGridPoint: Double
    let longitudeOfLastGridPoint: Double
    let iDirectionIncrement: Double
    let jDirectionIncrement: Double
    let scanningMode: Array<ScanningModes>
    
    enum ResolutionComponentFlags {
        case iNotGiven
        case iGiven
        case jNotGiven
        case jGiven
        case uvNE
        case uvXY
    }
    
    enum ScanningModes {
        case IncrementI
        case DecrementI
        case DecrementJ
        case IncrementJ
        case ConsecutiveI
        case ConsecutiveJ
        case SameDirection
        case OppositeDirection
    }
    
    init(_ stream:GribFileStream) throws {
        // Octet 15. Shape of the earth
        self.shapeOfTheEarth = try stream.readUI8()
        // Octet 16. Scale factor of radius of spherical earth
        self.scaleFactorOfRadiusOfSphericalEarth = try stream.readUI8()
        // Octets 17-20. Scaled value of radius of spherical earth
        self.scaledValueOfRadiusOfSphericalEarth = try stream.readUI32()
        // Octet 21. Scale factor of major axis of oblate spheroid earth
        self.scaleFactorOfEarthMajorAxis = try stream.readUI8()
        // Octets 22-25. Scaled value of major axis of oblate spheroid earth
        self.scaledValueOfEarthMajorAxis = try stream.readUI32()
        // Octet 26. Scale factor of minor axis of oblate spheroid earth
        self.scaleFactorOfEarthMinorAxis = try stream.readUI8()
        // Octets 27-30. Scaled value of minor axis of oblate spheroid earth
        self.scaledValueOfEarthMinorAxis = try stream.readUI32()
        // Octets 31-34. Ni - number of points along a parallel
        self.Ni = try stream.readUI32()
        // Octets 35-38. Nj - number of points along a meridian
        self.Nj = try stream.readUI32()
        // Octets 39-42. Basic angle of the initial production domain
        self.basicAngleOfTheInitialProductionDomain = try stream.readDoubleE6()
        // Octets 43-46. Subdivisions of basic angle used to define extreme longitudes and latitudes, and direction increments
        self.subdivisionsOfBasicAngle = try stream.readUI32()
        // Octets 47-50. La1 - latitude of first grid point
        self.latitudeOfFirstGridPoint = try stream.readDoubleE6()
        // Octets 51-54. Lo1 - longitude of first grid point
        self.longitudeOfFirstGridPoint = try stream.readDoubleE6()
        // Octet 55. Resolution and component flags
        self.resolutionAndComponentFlags = Section3Template0.resolutionAndComponentFlags(try stream.readUI8())
        // Octets 56-59. La2 - latitude of last grid point
        self.latitudeOfLastGridPoint = try stream.readDoubleE6()
        // Octet 60-63. Lo2 - longitude of last grid point
        self.longitudeOfLastGridPoint = try stream.readDoubleE6()
        // Octets 64-67. Di - i direction increment
        self.iDirectionIncrement = try stream.readDoubleE6()
        // Octets 68-71. Dj - j direction increment
        self.jDirectionIncrement = try stream.readDoubleE6()
        // Octet 72. Scanning mode
        self.scanningMode = Section3Template0.scanningMode(try stream.readUI8())
        // Octets 73-nn. List of number of points along each meridian or parallel
    }
    
    private static func resolutionAndComponentFlags(_ value:UInt8) -> Array<ResolutionComponentFlags> {
        // Create a Bit array
        var bits = Array<UInt8>()
        for i in 0 ..< 8 { bits.append((value << UInt8(i)) >> 7) }
        // Read Bits
        var components = Array<ResolutionComponentFlags>()
        if bits[2] == 0 { components.append(.iNotGiven) } else { components.append(.iGiven) }
        if bits[3] == 0 { components.append(.jNotGiven) } else { components.append(.jGiven) }
        if bits[4] == 0 { components.append(.uvNE) } else { components.append(.uvXY) }
        return components
    }
    
    private static func scanningMode(_ value:UInt8) -> Array<ScanningModes> {
        // Create a Bit array
        var bits = Array<UInt8>()
        for i in 0 ..< 8 { bits.append((value << UInt8(i)) >> 7) }
        // Read Bits
        var components = Array<ScanningModes>()
        if bits[0] == 0 { components.append(.IncrementI) } else { components.append(.DecrementI) }
        if bits[1] == 0 { components.append(.DecrementJ) } else { components.append(.IncrementJ) }
        if bits[2] == 0 { components.append(.ConsecutiveI) } else { components.append(.ConsecutiveJ) }
        if bits[3] == 0 { components.append(.SameDirection) } else { components.append(.OppositeDirection) }
        return components
    }
}
