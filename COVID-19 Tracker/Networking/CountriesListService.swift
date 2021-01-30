//
//  CountriesService.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2021/01/29.
//

import UIKit
import Alamofire

class CountriesListService {
    
    let headers: HTTPHeaders =  [
        "x-rapidapi-key": "3dfb6a3d80msh49e026617c05c52p182039jsnc2c6112247d0",
        "x-rapidapi-host": "covid-19-data.p.rapidapi.com"
    ]
    
    let countryArray = [Country].self
    
    let baseURL: URL?
    
    init() {
        self.baseURL = URL(string: "https://covid-19-data.p.rapidapi.com/help/countries")
    }

    func getCountryNames(completion: @escaping ([Country]?) -> Void) {
        
        AF.request(baseURL!, method: .get , headers: headers)
            .validate()
            .responseDecodable(of: countryArray) { (response) in
                let countriesArray = response.value
                completion(countriesArray)
            }
    }
}

