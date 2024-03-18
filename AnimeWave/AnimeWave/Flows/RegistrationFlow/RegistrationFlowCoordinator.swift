//
//  RegistrationFlowController.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 18.03.2024.
//

import UIKit

class RegistrationFlowCoordinator: BaseCoordinator {

    var router: Router
    var user: AnimeWaveUser?

    init(router: Router) {
        self.router = router
    }

    override func start() {
        showRegistrationController()
    }

    private func showRegistrationController() {
        let registrationViewController = RegistrationViewController(viewModel: RegistrationViewModel())
        registrationViewController.complitionHandler = { [weak self] user in
            self?.user = user
            self?.showConfigureProfileController()
        }
        router.push(registrationViewController, animated: true)
    }

    private func showConfigureProfileController() {
        let configureUserViewModel = ConfigureUserViewModel(currentUser: user)
        let configureUserViewController = ConfigureUserViewController(viewModel: configureUserViewModel)
        configureUserViewController.navigationItem.hidesBackButton = true
        configureUserViewController.complitionHandler = { [weak self] user in
            self?.user = user
            self?.flowComplitionHandler?()
        }

        router.push(configureUserViewController, animated: true)
    }
}
