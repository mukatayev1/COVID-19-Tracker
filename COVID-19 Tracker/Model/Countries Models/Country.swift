//
//  Country.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2021/01/18.
//

import Foundation

struct Country: Codable {
    let country: String
    let totalCases: String
    let newCases: String
    let totalDeaths: String
    let newDeaths: String
    let totalRecovered: String
    let activeCases: String
    
    enum CodingKeys: String, CodingKey {
        case country
        case totalCases
        case newCases
        case totalDeaths
        case newDeaths
        case totalRecovered
        case activeCases
    }
}
