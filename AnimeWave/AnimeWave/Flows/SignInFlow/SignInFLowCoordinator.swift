//
//  LoginFLowCoordinator.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 18.03.2024.
//

import UIKit

class SignInFLowCoordinator: BaseCoordinator {

    // MARK: - Variables
    private var router: Router

    // MARK: - Init
    init(router: Router) {
        self.router = router
    }

    // MARK: - Functions
    override func start() {
        showSignInViewController()
    }

    private func showSignInViewController() {
        let signInViewController = moduleFactory.createSignInModule()
        signInViewController.completionHandler = { [weak self] in
            guard let self else { return }
            self.flowCompletionHandler?()
        }
        router.push(signInViewController, animated: true)
    }
}
