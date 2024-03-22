//
//  RegistrationFlowController.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 18.03.2024.
//

import UIKit

class SignUpFlowCoordinator: BaseCoordinator {

    var router: Router

    init(router: Router) {
        self.router = router
    }

    override func start() {
        showSignUpController()
    }

    private func showSignUpController() {
        let signUpViewController = SignUpViewController(viewModel: SignUpViewModel())
        signUpViewController.completionHandler = { [weak self] in
            guard let self else { return }
            self.showConfigureProfileController()
        }
        router.push(signUpViewController, animated: true)
    }

    private func showConfigureProfileController() {
        let configureProfileViewModel = ConfigureProfileViewModel()
        let configureProfileViewController = ConfigureProfileViewController(viewModel: configureProfileViewModel)
        configureProfileViewController.navigationItem.hidesBackButton = true
        configureProfileViewController.complitionHandler = { [weak self] in
            guard let self else { return }
            self.flowCompletionHandler?()
        }

        router.push(configureProfileViewController, animated: true)
    }
}
