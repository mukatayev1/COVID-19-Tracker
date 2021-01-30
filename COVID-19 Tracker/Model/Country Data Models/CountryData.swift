//
//  CountryData.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2021/01/29.
//

import Foundation

struct CountryData: Codable {
    let country: String
    let confirmed: Int
    let critical: Int
    let deaths: Int
    let recovered: Int
    
    enum CodingKeys: String, CodingKey {
        case country
        case confirmed
        case critical
        case deaths
        case recovered
    }
}
