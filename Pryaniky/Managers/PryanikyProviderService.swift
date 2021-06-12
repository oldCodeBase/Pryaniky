//
//  PryanikyProviderService.swift
//  Pryaniky
//
//  Created by Ibragim Akaev on 08/06/2021.
//

import Foundation
import Moya

struct PryanikyProviderService: PryanikyProviderProtocol {
    
    var provider = MoyaProvider<PryanikyEndpoint>()
    
    func fetchData(completion: @escaping (Model) -> (Void)) {
        provider.request(.fetchData) { result in
            switch result {
            case .success(let response):
                do {
                    let result = try JSONDecoder().decode(Model.self, from: response.data)
                    completion(result)
                } catch {
                    print("error decoding JSON")
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
