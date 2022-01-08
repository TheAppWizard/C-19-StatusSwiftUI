//
//  Country.swift
//  C19SwiftUI
//
//  Created by Shreyas Vilaschandra Bhike on 05/01/22.
//

import Foundation

struct Country: Codable {
    
    var country: String
    var updated: Double
    var cases: Double
    var deaths: Double
    var active: Double
    var recovered: Double
    var population : Double
    var countryInfo: CountryInfo
}

struct CountryInfo: Codable {
    var _id: Int
    var iso2: String
    var iso3: String
    var lat: Double
    var long: Double
    var flag: String
}
