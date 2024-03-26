//
//  RegistrationFlowController.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 18.03.2024.
//

import UIKit

class SignUpFlowCoordinator: BaseCoordinator {

    var router: Router
    var userForSignUp: UserForSignUp

    init(router: Router) {
        self.router = router
        self.userForSignUp = UserForSignUp(id: "", login: "", email: "", password: "")
    }

    override func start() {
        showSignUpController()
    }

    private func showSignUpController() {
        let signUpViewController = SignUpViewController(viewModel: SignUpViewModel())
        signUpViewController.completionHandler = { [weak self] user in
            guard let self else { return }
            self.userForSignUp = user
            self.showConfigureProfileController()
        }
        router.push(signUpViewController, animated: true)
    }

    private func showConfigureProfileController() {
        let configureProfileViewModel = ConfigureProfileViewModel(userForSignUp: userForSignUp)
        let configureProfileViewController = ConfigureProfileViewController(viewModel: configureProfileViewModel)
        configureProfileViewController.complitionHandler = { [weak self] in
            guard let self else { return }
            self.flowCompletionHandler?()
        }

        router.push(configureProfileViewController, animated: true)
    }
}
