//
//  AppCoordinator.swift
//  Pryaniky
//
//  Created by Ibragim Akaev on 09/06/2021.
//

import UIKit

protocol Coordinator: AnyObject {
    func start()
    func childDidFinish(_ childCoordinator: Coordinator)
    var childCoordinators: [Coordinator] { get }
}

extension Coordinator {
    func childDidFinish(_ childCoordinator: Coordinator) {}
}

final class AppCoordinator: Coordinator {
    
    private let window: UIWindow
    private(set) var childCoordinators: [Coordinator] = []
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        let mainListCoordinator  = MainListCoordinator(navigationController: navigationController)
        childCoordinators.append(mainListCoordinator)
        mainListCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
