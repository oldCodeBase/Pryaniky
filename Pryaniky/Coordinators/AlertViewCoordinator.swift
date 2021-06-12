//
//  AlertViewCoordinator.swift
//  Pryaniky
//
//  Created by Ibragim Akaev on 09/06/2021.
//

import UIKit

final class AlertViewCoordinator: Coordinator {
    
    private let modelObject: DataResponse
    private let navigationController: UINavigationController
    private(set) var selectedSegment: Int?
    private(set) var childCoordinators: [Coordinator] = []
    var parentCoordinator: MainListCoordinator?
    
    init(navigationController: UINavigationController, modelObject: DataResponse, selectedSegment: Int?) {
        self.navigationController = navigationController
        self.modelObject          = modelObject
        self.selectedSegment      = selectedSegment
    }
    
    func start() {
        let alertVC = AlertViewController()
        let alertVCViewModel = AlertViewModel(modelObject: modelObject, selectedSegment: selectedSegment)
        alertVC.viewModel = alertVCViewModel
        alertVCViewModel.coordinator = self
        alertVC.modalPresentationStyle = .overFullScreen
        alertVC.modalTransitionStyle   = .crossDissolve
        navigationController.present(alertVC, animated: true, completion: nil)
    }
    
    func didFinish() {
        parentCoordinator?.childDidFinish(self)
        navigationController.dismiss(animated: true, completion: nil)
    }
}

