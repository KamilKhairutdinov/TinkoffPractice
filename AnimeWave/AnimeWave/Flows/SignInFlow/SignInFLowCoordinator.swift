//
//  LoginFLowCoordinator.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 18.03.2024.
//

import UIKit

class SignInFLowCoordinator: BaseCoordinator {

    var router: Router

    init(router: Router) {
        self.router = router
    }

    override func start() {
        showSignInViewController()
    }

    private func showSignInViewController() {
        let signInViewController = SignInViewController(viewModel: SignInViewModel())
        signInViewController.complitionHandler = { [weak self] in
            guard let self else { return }
            self.flowComplitionHandler?()
        }
        router.push(signInViewController, animated: true)
    }
}
