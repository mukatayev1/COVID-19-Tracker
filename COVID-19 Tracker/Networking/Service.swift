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
    "x-rapidapi-host": "coronavirus-map.p.rapidapi.com"
]

//let parameters: Parameters = [
//    "country": "Kazakhstan"
//]

class Service {
    let baseURL: URL?
    
    init() {
        self.baseURL = URL(string: "https://coronavirus-map.p.rapidapi.com/v1/summary/latest")
    }
//    completion: @escaping (Result?) -> Void
    func getSummary(completion: @escaping (Result?) -> Void) {
        
        AF.request(baseURL!, method: .get , headers: headers)
            .validate()
            .responseDecodable(of: Result.self) { (response) in
                guard let result = response.value else { return }
                completion(result)
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
}
