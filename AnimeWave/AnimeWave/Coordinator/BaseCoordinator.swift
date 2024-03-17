//
//  BaseCoordinator.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 13.03.2024.
//

import UIKit

class BaseCoordinator: Coordinator {

    var childCoordinators: [Coordinator]
    var flowComplitionHandler: (() -> Void)?

    init() {
        childCoordinators = []
    }

    func start() {
        fatalError("Function start must be overriden")
    }

    func addDependency(_ coordinator: Coordinator) {
        guard !childCoordinators.contains(where: { $0 === coordinator }) else { return }
        childCoordinators.append(coordinator)
    }

    func removeDependency(_ coordinator: Coordinator) {

        guard !childCoordinators.isEmpty else { return }

        // Clear child coordinators recursively
        if let coordinator = coordinator as? BaseCoordinator, !coordinator.childCoordinators.isEmpty {
            coordinator.childCoordinators
                .filter({ $0 !== coordinator })
                .forEach({ coordinator.removeDependency($0) })
        }
        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }
}
