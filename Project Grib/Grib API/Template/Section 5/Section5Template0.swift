//
//  Section5Template0.swift
//  Project Grib
//
//  Created by Tristan Beaton on 20/09/17.
//  Copyright © 2017 Tristan Beaton. All rights reserved.
//

import Foundation

class Section5Template0 : DataRepresentationTemplate {
    
    let referenceValue: Float32
    let binaryScaleFactor: Int16
    let decimalScaleFactor: Int16
    let bitsPerValue: UInt8
    let typeOfOriginalFieldValues: Section5CodeTable1
    
    init(_ stream:GribFileStream) throws {
        // Octets 12-15. Reference value (R)
        self.referenceValue = try stream.readFloat()
        // Octets 16-17. Binary scale factor (E)
        self.binaryScaleFactor = try stream.readInt16()
        // Octets 18-19. Decimal scale factor (D)
        self.decimalScaleFactor = try stream.readInt16()
        // Octet 20. Number of bits used for each packed value for simple packing, or for each group reference value for complex packing or spatial differencing
        self.bitsPerValue = try stream.readUI8()
        // Octet 21. Type of original field values
        self.typeOfOriginalFieldValues = Section5CodeTable1(try stream.readUI8())
    }
}
/*
 92.6.3 Data shall be coded in the form of non-negative scaled differences from a reference value.
 
 NOTES:
 (1)  The reference value is normally the minimum value of the data set which is represented.
 (2)  The actual value Y (in the units of Code table 2) is linked to the coded value X, the reference value R, the binary scale
      factor E and the decimal scale factor D by means of the following formula: Y x 10D= R + X x 2E
 
 (3)  When second-order grid-point packing is indicated, the actual value Y (in the units of Code table 2) is linked to the coded
      values Xi and Xj, the reference value R, the binary scale factor E and the decimal scale factor D by means of the following
      formula: Y x 10D = R + (Xi + Xj) x 2E
 
92.6.4 The reference value shall be represented over 4 octets as a single precision floating point number,
       consisting of a leading sign bit, a 7-bit characteristic and a 24-bit binary fraction.
 
 NOTES:
 (1)  The characteristic is convertible to a power of 16 by subtracting 64 from its 7-bit representation.
 (2)  The reference value R is linked to the binary numbers s, A, B, representing the sign (1 bit) positive coded as "0",
      negative coded as "1", a biased exponent (exponent + 64) (7 bits), and the mantissa (24 bits), by means of the following
      formula: R=(-1)s x 2(-24) x B x 16(A-64)
*/
