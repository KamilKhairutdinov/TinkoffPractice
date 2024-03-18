//
//  RegistrationFlowController.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 18.03.2024.
//

import UIKit

class RegistrationFlowCoordinator: BaseCoordinator {

    var router: Router

    init(router: Router) {
        self.router = router
    }

    override func start() {
        showRegistrationController()
    }

    private func showRegistrationController() {
        let registrationViewController = RegistrationViewController(viewModel: RegistrationViewModel())
        registrationViewController.complitionHandler = { [weak self] in
            self?.showConfigureProfileController()
        }
        router.push(registrationViewController, animated: true)
    }

    private func showConfigureProfileController() {
        let configureUserViewModel = ConfigureUserViewModel()
        let configureUserViewController = ConfigureUserViewController(viewModel: configureUserViewModel)
        configureUserViewController.navigationItem.hidesBackButton = true
        configureUserViewController.complitionHandler = { [weak self] in
            self?.flowComplitionHandler?()
        }

        router.push(configureUserViewController, animated: true)
    }
}
