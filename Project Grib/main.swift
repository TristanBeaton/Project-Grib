//
//  main.swift
//  Project Grib
//
//  Created by Tristan Beaton on 19/09/17.
//  Copyright © 2017 Tristan Beaton. All rights reserved.
//

import Foundation

do {
    let url = URL(string: "http://nomads.ncep.noaa.gov/cgi-bin/filter_gfs_0p25.pl?file=gfs.t00z.pgrb2.0p25.f000&lev_10_m_above_ground=on&var_UGRD=on&var_VGRD=on&subregion=&leftlon=166&rightlon=179&toplat=-34&bottomlat=-47&dir=%2Fgfs.2017091900")!
    let data = try Data(contentsOf: url)
    let stream = GribFileStream(data: data)
    
    let _ = try GribMessage(stream)
} catch let error {
    print(error)
}
