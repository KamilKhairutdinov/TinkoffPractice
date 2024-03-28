//
//  RegistrationFlowController.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 18.03.2024.
//

import UIKit

class SignUpFlowCoordinator: BaseCoordinator {

    var router: Router
    var userForSignUp: UserForSignUp?

    init(router: Router) {
        self.router = router
    }

    override func start() {
        showSignUpController()
    }

    private func showSignUpController() {
        let signUpViewController = moduleFactory.createSignUpModule()
        signUpViewController.completionHandler = { [weak self] user in
            guard let self else { return }
            self.userForSignUp = user
            self.showConfigureProfileController()
        }
        router.push(signUpViewController, animated: true)
    }

    private func showConfigureProfileController() {
        guard let userForSignUp else { return }
        let configureProfileViewController = moduleFactory.createConfigureProfileModule(
            userForSignUp: userForSignUp
        )
        configureProfileViewController.complitionHandler = { [weak self] in
            guard let self else { return }
            self.flowCompletionHandler?()
        }

        router.push(configureProfileViewController, animated: true)
    }
}
