//
//  LoginFLowCoordinator.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 18.03.2024.
//

import UIKit

class LoginFLowCoordinator: BaseCoordinator {

    var router: Router

    init(router: Router) {
        self.router = router
    }

    override func start() {
        showLoginViewController()
    }

    private func showLoginViewController() {
        let loginViewController = LoginViewController(viewModel: LoginViewModel())
        loginViewController.complitionHandler = { [weak self] in
            self?.flowComplitionHandler?()
        }
        router.push(loginViewController, animated: true)
    }
}
