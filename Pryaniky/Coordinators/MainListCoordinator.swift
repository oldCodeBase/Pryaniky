//
//  MainListCoordinator.swift
//  Pryaniky
//
//  Created by Ibragim Akaev on 09/06/2021.
//

import UIKit

final class MainListCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    private let provider = PryanikyProviderService()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainViewController = MainViewController()
        let mainListViewModel  = MainListViewModel(networkProvider: provider)
        mainListViewModel.coordinator = self
        mainViewController.viewModel  = mainListViewModel
        navigationController.setViewControllers([mainViewController], animated: false)
    }
    
    func startAlertViewCoordinator(with modelObject: DataResponse, selectedSegment: Int?) {
        let alertViewCoordinator = AlertViewCoordinator(navigationController: navigationController,
                                                        modelObject: modelObject,
                                                        selectedSegment: selectedSegment ?? nil)
        alertViewCoordinator.parentCoordinator = self
        childCoordinators.append(alertViewCoordinator)
        alertViewCoordinator.start()
    }
    
    func childDidFinish(_ childCoordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
            return childCoordinator === coordinator
        }) {
            childCoordinators.remove(at: index)
        }
    }
}
