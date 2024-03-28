//
//  StartFlowCoordinator.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 17.03.2024.
//

import UIKit

class AuthFlowCoordinator: BaseCoordinator {

    // MARK: - Variables
    private var router: Router

    // MARK: - Init
    init(router: Router) {
        self.router = router
    }

    // MARK: - Functions
    override func start() {
        showAuthController()
    }

    private func showAuthController() {
        let authViewController = moduleFactory.createAuthModule()
        authViewController.completionHandler = { [weak self] states in
            guard let self else { return }
            switch states {
            case .signIn:
                self.runSignInFlow()
            case .signUp:
                self.runSignUpFlow()
            }
        }
        router.setRootController(authViewController)
    }

    private func runSignUpFlow() {
        let signUpFlowCoordinator = coordinatorFactory.createSignUpCoordinator(router: router)
        signUpFlowCoordinator.start()
        addDependency(signUpFlowCoordinator)
        signUpFlowCoordinator.flowCompletionHandler = { [weak self] in
            guard let self else { return }
            self.router.popToRootController(animated: false)
            self.runSignInFlow()
            self.removeDependency(signUpFlowCoordinator)
        }
    }

    private func runSignInFlow() {
        let signInFlowCoordinator = coordinatorFactory.createSignInCoordinator(router: router)
        addDependency(signInFlowCoordinator)
        signInFlowCoordinator.flowCompletionHandler = { [weak self] in
            guard let self else { return }
            self.removeDependency(signInFlowCoordinator)
            self.flowCompletionHandler?()
        }
        signInFlowCoordinator.start()
    }
}
