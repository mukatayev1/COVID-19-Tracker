//
//  Service.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2021/01/08.
//

import UIKit
import Alamofire

let headers: HTTPHeaders = [
    "x-rapidapi-key": "3dfb6a3d80msh49e026617c05c52p182039jsnc2c6112247d0",
    "x-rapidapi-host": "covid-19-data.p.rapidapi.com"
]

class Service {
    //https://covid-19-data.p.rapidapi.com/totals
    let baseURL: URL?
    
    init() {
        self.baseURL = URL(string: "https://covid-19-data.p.rapidapi.com/totals")
    }
    
    func getSummary(completion: @escaping (Summary?) -> Void) {
        
        AF.request(baseURL!, method: .get, headers: headers)
            .validate()
            .responseJSON { (response) in
                
                if let jsonDictionary = response.value as? [[String: Any]] {
                    
                    if let summaryDictionary = jsonDictionary[0] as? [String: Any] {
                        let summary = Summary(summaryDictionary: summaryDictionary)
                        completion(summary)
                    } else {
                        completion(nil)
                    }
                }
            }
    }
}

/*
 success(<__NSSingleObjectArrayI 0x600002789180>(
 {
 confirmed = 93307139;
 critical = 108595;
 deaths = 2642052;
 lastChange = "2021-01-10T23:44:35+01:00";
 lastUpdate = "2021-01-10T23:45:04+01:00";
 recovered = 65910267;
 }
 )
 )
 */
