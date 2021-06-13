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
        guard let data  = model?.data, let views = model?.view else { return [] }
        var sortedData: [DataResponse] = []
        
        views.forEach { view in
            if let sortedElement = data.first(where: { $0.name == view }) {
                if sortedData.count < data.count {
                    sortedData.append(sortedElement)
                }
            }
        }
        
        return sortedData
    }
}
