//
//  Summary.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2021/01/06.
//

import Foundation

class Summary {
    let confirmed: Int
    let critical: Int
    let deaths: Int
    let lastChange: String
    let lastUpdate: String
    let recovered: Int
    
    struct SummaryKeys {
        static let confirmed = "confirmed"
        static let critical = "critical"
        static let deaths = "deaths"
        static let lastChange = "lastChange"
        static let lastUpdate = "lastUpdate"
        static let recovered = "recovered"
    }
    
    init(summaryDictionary: [String: Any]) {
        confirmed = summaryDictionary[SummaryKeys.confirmed] as! Int
        critical = summaryDictionary[SummaryKeys.critical] as! Int
        deaths = summaryDictionary[SummaryKeys.deaths] as! Int
        lastChange = summaryDictionary[SummaryKeys.lastChange] as! String
        lastUpdate = summaryDictionary[SummaryKeys.lastUpdate] as! String
        recovered = summaryDictionary[SummaryKeys.recovered] as! Int
    }
}
