//
//  Result.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2021/01/11.
//

import Foundation

struct Data: Codable {
    let summary: Summary
    let change: Change
    let generatedOn: Int
    
    enum CodingKeys: String, CodingKey {
        case summary
        case change
        case generatedOn = "generated_on"
    }
}

//extension Data: Displayable {
//
//    var confirmedLabelText: String {
//        String(confirmed)
//    }
//    
//    var deathsLabelText: String {
//        String(deaths)
//    }
//    
//    var lastCheckedLabelText: String {
//        lastChecked
//    }
//    
//    var lastReportedLabelText: String {
//        lastReported
//    }
//    
//    var locationLabelText: String {
//        location
//    }
//    
//    var recoveredLabelText: String {
//        String(recovered)
//    }
//    
//    
//}
