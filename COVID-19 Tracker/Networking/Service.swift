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
    "x-rapidapi-host": "covid-19-coronavirus-statistics.p.rapidapi.com"
]

//let parameters: Parameters = [
//    "country": "Kazakhstan"
//]

class Service {
    let baseURL: URL?
    
    init() {
        self.baseURL = URL(string: "https://covid-19-coronavirus-statistics.p.rapidapi.com/v1/total")
    }
    //completion: @escaping (Data?) -> Void
    func getSummary(completion: @escaping (Result?) -> Void) {
        
        AF.request(baseURL!, method: .get , headers: headers)
            .validate()
            .responseDecodable(of: Result.self) { (response) in
                guard let result = response.value else { return }
                completion(result)
            }
    }
}

//For time
/*
 func getDate(unixTime: TimeInterval, timezone: Int) -> String {
     let usableDate = Date(timeIntervalSince1970: unixTime)
     
     let dateFormatter = DateFormatter()
     dateFormatter.dateStyle = .none
     dateFormatter.timeStyle = .short
     dateFormatter.timeZone = TimeZone(secondsFromGMT: timezone)
     let dateString = "Local time: \(dateFormatter.string(from: usableDate))"
     computeBackground(date: usableDate, timezone: timezone)
     
     return dateString
 }
 */
