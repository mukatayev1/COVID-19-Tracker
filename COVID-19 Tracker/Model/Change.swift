//
//  Change.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2021/01/17.
//

import Foundation

struct Change: Codable {
    let totalCases: Int
    let activeCases: Int
    let deaths: Int
    let recovered: Int
    let critical: Int
    let tested: Int
    let deathRatio: Double
    let recoveryRatio: Double
    
    enum CodingKeys: String, CodingKey {
        case totalCases = "total_cases"
        case activeCases = "active_cases"
        case deaths
        case recovered
        case critical
        case tested
        case deathRatio = "death_ratio"
        case recoveryRatio = "recovery_ratio"
    }
}
