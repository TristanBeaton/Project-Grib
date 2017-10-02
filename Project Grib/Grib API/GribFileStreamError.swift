//
//  GribFileStreamError.swift
//  Project Grib
//
//  Created by Tristan Beaton on 2/10/17.
//  Copyright © 2017 Tristan Beaton. All rights reserved.
//

import Foundation

enum GribFileStreamError : Error {
    case EndOfFile
    case InvalidFile
    case InvalidSection(UInt8)
    case InvalidString
    case UnsupportedTemplate(Template)
    case Unknown
}
