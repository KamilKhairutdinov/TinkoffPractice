//
//  StartFlowCoordinator.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 17.03.2024.
//

import UIKit

class StartFlowCoordinator: BaseCoordinator {

    var router: Router

    init(router: Router) {
        self.router = router
    }

    override func start() {
        showStartController()
    }

    private func showStartController() {
        let startViewController = StartViewController()
        startViewController.complitionHandler = { [weak self] states in
            switch states {
            case .auth:
                self?.runLoginFlow()
            case .register:
                self?.runRegistrationFlow()
            }
        }
        router.setRootController(startViewController)
    }

    private func runRegistrationFlow() {
        let registrationFlowCoordinator = coordinatorFactory.createRegistrationCoordinator(router: router)
        registrationFlowCoordinator.start()
        addDependency(registrationFlowCoordinator)
        registrationFlowCoordinator.flowComplitionHandler = { [weak self] in
            self?.start()
            self?.runLoginFlow()
            self?.removeDependency(registrationFlowCoordinator)
        }
    }

    private func runLoginFlow() {
        let loginFlowCoordinator = coordinatorFactory.createLoginCoordinator(router: router)
        loginFlowCoordinator.start()
        addDependency(loginFlowCoordinator)
        loginFlowCoordinator.flowComplitionHandler = { [weak self] in
            self?.removeDependency(loginFlowCoordinator)
        }
    }

}
