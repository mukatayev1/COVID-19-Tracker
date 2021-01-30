//
//  Service.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2021/01/08.
//

import UIKit
import Alamofire

class TotalDataService {
    
    let headers: HTTPHeaders = [
        "x-rapidapi-key": "3dfb6a3d80msh49e026617c05c52p182039jsnc2c6112247d0",
        "x-rapidapi-host": "coronavirus-map.p.rapidapi.com"
    ]
    
    let baseURL: URL?
    
    init() {
        self.baseURL = URL(string: "https://coronavirus-map.p.rapidapi.com/v1/summary/latest")
    }

    func getSummary(completion: @escaping (Summary?) -> Void) {
        
        AF.request(baseURL!, method: .get , headers: headers)
            .validate()
            .responseDecodable(of: SummaryResult.self) { (response) in
                guard let resultData = response.value?.data else { return }
                let summary = resultData.summary
                completion(summary)
            }
    }
    
    func getTime(completion: @escaping (Int?) -> Void) {
        
        AF.request(baseURL!, method: .get , headers: headers)
            .validate()
            .responseDecodable(of: SummaryResult.self) { (response) in
                guard let resultData = response.value?.data else { return }
                let time = resultData.generatedOn
                completion(time)
            }
    }
    
    func checkServiceResult(completion: @escaping (Any?) -> Void) {
        AF.request(baseURL!, headers: headers)
            .validate()
            .response { response in
                switch response.result {
                case .success:
                    completion(response.result)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func getChanges(completion: @escaping (Change?) -> Void) {
        
        AF.request(baseURL!, method: .get , headers: headers)
            .validate()
            .responseDecodable(of: SummaryResult.self) { (response) in
                guard let resultData = response.value?.data else { return }
                let changes = resultData.change
                completion(changes)
            }
    }
}
