//
//  PryanikyProviderProtocol.swift
//  Pryaniky
//
//  Created by Ibragim Akaev on 08/06/2021.
//

import Foundation
import Moya

protocol PryanikyProviderProtocol {
    var provider: MoyaProvider<PryanikyEndpoint> { get }
    func fetchData(completion: @escaping (Model) -> (Void))
}
