//
//  main.swift
//  Project Grib
//
//  Created by Tristan Beaton on 19/09/17.
//  Copyright © 2017 Tristan Beaton. All rights reserved.
//

import Foundation

let baseUrl = "http://nomads.ncep.noaa.gov/cgi-bin/filter_gfs_1p00.pl?file=gfs.t18z.pgrb2.1p00.f000&dir=%2Fgfs.2017100118&subregion=&leftlon=166&rightlon=179&toplat=-32&bottomlat=-47"
let tempUrl = baseUrl + "&lev_surface=on&var_TMP=on"
let presUrl = baseUrl + "&lev_mean_sea_level=on&var_PRMSL=on"
let windUrl = baseUrl + "&lev_10_m_above_ground=on&var_UGRD=on&var_VGRD=on"

do {
    let url = URL(string: "http://nomads.ncep.noaa.gov/cgi-bin/filter_gfs_0p25.pl?file=gfs.t00z.pgrb2.0p25.f000&lev_surface=on&var_TMP=on&subregion=&leftlon=166&rightlon=179&toplat=-32&bottomlat=-47&dir=%2Fgfs.2017100200")!
    let data = try Data(contentsOf: url)
    let stream = GribFileStream(data: data)

    while stream.hasBytesAvailable {
        
        let _ = try GribMessage(stream)
    }
    
} catch let error {
    print(error)
}

//extension FloatingPoint {
//    var degreesToRadians: Self { return self * .pi / 180 }
//    var radiansToDegrees: Self { return self * 180 / .pi }
//}
//
//let u = 0.15976837
//let v = -1.8172119
//
//let ws = sqrt(pow(u,2) + pow(v,2)) * 3.6
//let dir = 270 - atan2(v, u).radiansToDegrees
//
//print("\(Int(round(dir)))º @ \(Int(round(ws)))km/h")

