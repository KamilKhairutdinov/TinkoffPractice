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
        showConfigureProfileController()
    }

    private func showRegistrationController() {
        let registrationViewController = RegistrationViewController(viewModel: RegistrationViewModel())
        registrationViewController.complitionHandler = { [weak self] in
            self?.showConfigureProfileController()
        }
        router.push(registrationViewController, animated: true)
    }

    private func showConfigureProfileController() {
        let configureUserViewController = ConfigureUserViewController(viewModel: ConfigureUserViewModel())
        router.push(configureUserViewController, animated: true)
    }
}
