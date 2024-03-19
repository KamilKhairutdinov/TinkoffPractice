//
//  StartFlowCoordinator.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 17.03.2024.
//

import UIKit

class AuthFlowCoordinator: BaseCoordinator {

    var router: Router

    init(router: Router) {
        self.router = router
    }

    override func start() {
        showAuthController()
    }

    private func showAuthController() {
        let authViewController = AuthViewController()
        authViewController.complitionHandler = { [weak self] states in
            switch states {
            case .auth:
                self?.runSignInFlow()
            case .register:
                self?.runSignUpFlow()
            }
        }
        router.setRootController(authViewController)
    }

    private func runSignUpFlow() {
        let signUpFlowCoordinator = coordinatorFactory.createSignUpCoordinator(router: router)
        signUpFlowCoordinator.start()
        addDependency(signUpFlowCoordinator)
        signUpFlowCoordinator.flowComplitionHandler = { [weak self] in
            self?.router.popToRootController(animated: false) // Test
            self?.runSignInFlow()
            self?.removeDependency(signUpFlowCoordinator)
        }
    }

    private func runSignInFlow() {
        let signInFlowCoordinator = coordinatorFactory.createSignInCoordinator(router: router)
        addDependency(signInFlowCoordinator)
        signInFlowCoordinator.flowComplitionHandler = { [weak self] in
            self?.removeDependency(signInFlowCoordinator)
            self?.flowComplitionHandler?()
        }
        signInFlowCoordinator.start()
    }
}
