//
//  Model.swift
//  Twnty
//
//  Created by Joe Vargas on 8/1/20.
//  Copyright © 2020 Joe Vargas. All rights reserved.
//

import Foundation

struct TotalData {
    let confirmed: Int64
    let critical: Int64
    let deaths: Int64
    let recovered: Int64
    
    var fatalityRate: Double{
        return (100.00 * Double(deaths) / Double(confirmed))
    }
    var recoveredRate: Double{
        return (100.00 * Double(recovered) / Double(confirmed))
    }
}

struct CountryData {
    let country: String
    let confirmed: Int64
    let critical: Int64
    let deaths: Int64
    let recovered: Int64
    let latitude: Double
    let longitude: Double
    
    var fatalityRate: Double{
        return (100.00 * Double(deaths) / Double(confirmed))
    }
    var recoveredRate: Double{
        return (100.00 * Double(recovered) / Double(confirmed))
    }
}

let testTotalData = TotalData(confirmed: 404, critical: 404, deaths: 404, recovered: 404)
let testCountryData = CountryData(country: "n/a", confirmed: 404, critical: 404, deaths: 404, recovered: 404, latitude: 404.00, longitude: 404.00)
