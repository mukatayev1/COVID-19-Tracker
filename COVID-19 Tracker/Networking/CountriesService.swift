//
//  CountriesService.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2021/01/17.
//

import UIKit
import Alamofire

class CountriesService {
    
    let headers: HTTPHeaders = [
        "x-rapidapi-key": "3dfb6a3d80msh49e026617c05c52p182039jsnc2c6112247d0",
        "x-rapidapi-host": "covid-19-coronavirus-statistics2.p.rapidapi.com"
    ]
    let baseURL: URL?
    
    init() {
        self.baseURL = URL(string: "https://covid-19-coronavirus-statistics2.p.rapidapi.com/countriesData")
    }
    
    //completion: @escaping (Summary?) -> Void
    func getCountries() {
        AF.request(baseURL!, method: .get, headers: headers)
            .validate()
            .responseDecodable(of: CountriesResult.self) { (response) in
                print(response)
            }
    }
}
