//
//  ModuleFactory.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 28.03.2024.
//

import Foundation

class ModuleFactory: ModuleFactoryProtocol {

    func createAuthModule() -> AuthViewController {
        AuthViewController()
    }

    func createSignInModule() -> SignInViewController {
        SignInViewController(viewModel: SignInViewModel())
    }

    func createSignUpModule() -> SignUpViewController {
        SignUpViewController(viewModel: SignUpViewModel())
    }

    func createConfigureProfileModule(userForSignUp: UserForSignUp) -> ConfigureProfileViewController {
        ConfigureProfileViewController(
            viewModel: ConfigureProfileViewModel(userForSignUp: userForSignUp)
        )
    }

    func createMainModule() -> MainTabBarViewController {
        MainTabBarViewController()
    }

    func createAnimeListModule() -> AnimeListViewController {
        AnimeListViewController()
    }

    func createSearchModule() -> SearchViewController {
        SearchViewController()
    }

    func createCalendarModule() -> CalendarViewController {
        CalendarViewController()
    }

    func createProfileModule() -> ProfileViewController {
        ProfileViewController(viewModel: ProfileViewModel())
    }
}
