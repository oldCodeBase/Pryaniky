//
//  MainListViewModel.swift
//  Pryaniky
//
//  Created by Ibragim Akaev on 09/06/2021.
//

import Foundation

final class MainListViewModel {
    
    var model: Model?
    var title = "Pryaniky"
    
    var coordinator: MainListCoordinator?
    var networkProvider: PryanikyProviderProtocol!
    
    init(networkProvider: PryanikyProviderProtocol) {
        self.networkProvider = networkProvider
    }
    
    var cells: [DataResponse] {
        sortedModel
    }
    
    func cell(at indexPath: IndexPath) -> DataResponse {
        sortedModel[indexPath.row]
    }
    
    func selectedRow(at indexPath: IndexPath) -> DataResponse {
        sortedModel[indexPath.row]
    }
    
    var sortedModel: [DataResponse] {
        guard let dataModel = model?.data else { return [DataResponse]() }
        let sortedData = dataModel.sorted { $0.name.hashValue < $1.name.hashValue }
        return sortedData
    }
}
