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
    
    func getSummary() {
        AF.request(baseURL as! URLConvertible, method: .get, headers: headers)
            .validate()
            .responseJSON { (response) in
                let jsonDictionary = response.value as? [[String: Any]]
                
            }
    }
}
