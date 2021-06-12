//
//  PryanikyEndpoint.swift
//  Pryaniky
//
//  Created by Ibragim Akaev on 08/06/2021.
//

import Foundation
import Moya

enum PryanikyEndpoint {
    case fetchData
}

extension PryanikyEndpoint: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://pryaniky.com")!
    }
    
    var path: String {
        switch self {
        case .fetchData:
            return "/static/json/sample.json"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
