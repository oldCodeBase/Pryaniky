//
//  AlertViewModel.swift
//  Pryaniky
//
//  Created by Ibragim Akaev on 09/06/2021.
//

import Foundation

final class AlertViewModel {
    
    var coordinator: AlertViewCoordinator?
    var modelObject: DataResponse
    var selectedSegment: Int?
    
    init(modelObject: DataResponse, selectedSegment: Int?) {
        self.modelObject     = modelObject
        self.selectedSegment = selectedSegment
    }
    
    var title: String {
        "The cell named: \(modelObject.name.rawValue.uppercased())"
    }
    
    var message: String {
        "was pressed"
    }
    
    var segmentDescribeText: String {
        "Segment №"
    }
    
    func viewDidFinish() {
        coordinator?.didFinish()
    }
}
