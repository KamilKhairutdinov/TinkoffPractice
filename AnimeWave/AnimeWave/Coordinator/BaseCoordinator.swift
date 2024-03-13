//
//  BaseCoordinator.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 13.03.2024.
//

import UIKit

class BaseCoordinator: Coordinator {

    var navigationController: UINavigationController
    var childCoordinators: [Coordinator]
    var flowComplitionHandler: FlowComplitionHandler?

    func start() {
        fatalError("Function start must be overriden")
    }

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        childCoordinators = []
    }

    func addDependancy(coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }

    func removeDependancy(coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator}
    }
}
