//
//  BaseCoordinator.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 13.03.2024.
//

import UIKit

class BaseCoordinator: CoordinatorProtocol {

    // MARK: - Variables
    var childCoordinators: [CoordinatorProtocol]
    var flowCompletionHandler: (() -> Void)?
    let coordinatorFactory: CoordinatorFactoryProtocol
    let moduleFactory: ModuleFactory

    // MARK: - Init
    init() {
        childCoordinators = []
        coordinatorFactory = CoordinatorFactory()
        moduleFactory = ModuleFactory()
    }

    // MARK: - Functions
    func start() {
        fatalError("Function start must be overriden")
    }

    func addDependency(_ coordinator: CoordinatorProtocol) {
        guard !childCoordinators.contains(where: { $0 === coordinator }) else { return }
        childCoordinators.append(coordinator)
    }

    func removeDependency(_ coordinator: CoordinatorProtocol) {

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
