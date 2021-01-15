//
//  Result.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2021/01/11.
//

import Foundation

struct Data: Codable {
    let confirmed: Int
    let deaths: Int
    let lastChecked: String
    let lastReported: String
    let location: String
    let recovered: Int
    
    enum CodingKeys: String, CodingKey {
        case confirmed
        case deaths
        case lastChecked
        case lastReported
        case location
        case recovered
    }
}

extension Data: Displayable {
    var confirmedLabelText: String {
        String(confirmed)
    }
    
    var deathsLabelText: String {
        String(deaths)
    }
    
    var lastCheckedLabelText: String {
        lastChecked
    }
    
    var lastReportedLabelText: String {
        lastReported
    }
    
    var locationLabelText: String {
        location
    }
    
    var recoveredLabelText: String {
        String(recovered)
    }
    
    
}
