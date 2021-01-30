//
//  CountryService.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2021/01/29.
//

import Foundation
import Alamofire

class CountryDataService {
    let headers: HTTPHeaders = [
        "x-rapidapi-key": "3dfb6a3d80msh49e026617c05c52p182039jsnc2c6112247d0",
        "x-rapidapi-host": "covid-19-data.p.rapidapi.com"
    ]
    
    var baseURL: URL?
    
    init() {}
    
    func getLatestCountryData(for country: String, completion: @escaping ([CountryData]?) -> Void) {

        baseURL = URL(string: "https://covid-19-data.p.rapidapi.com/country?name=\(checkForSpace(string: country))")
        
        AF.request(baseURL!, method: .get , headers: headers)
            .validate()
            .responseDecodable(of: [CountryData].self) { (response) in
                let countryData = response.value
                completion(countryData)
            }
    }
    //MARK: - Helpers
    
    func checkForSpace(string: String) -> String {
        return string.replacingOccurrences(of: " ", with: "%20")
    }
}
