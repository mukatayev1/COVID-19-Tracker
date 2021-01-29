//
//  Country.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2021/01/29.
//

import Foundation

struct Country: Codable {
    let name: String?
    let alpha2code: String?
    let alpha3code: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case alpha2code
        case alpha3code
    }
}
