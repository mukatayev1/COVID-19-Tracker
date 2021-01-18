//
//  CountriesResult.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2021/01/18.
//

import Foundation

struct CountriesResult: Codable {
    let result: [Country]
    
    enum CodingKeys: String, CodingKey {
        case result
    }
}
