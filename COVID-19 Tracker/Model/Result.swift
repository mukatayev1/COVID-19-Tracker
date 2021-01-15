//
//  Result.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2021/01/13.
//

import Foundation

struct Result: Codable {
    let data: Data
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}
