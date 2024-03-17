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
        let registrationViewController = RegistrationViewController()
        router.push(registrationViewController, animated: true)
    }
}
