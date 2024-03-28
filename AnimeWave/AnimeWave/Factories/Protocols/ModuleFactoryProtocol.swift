//
//  ModuleFactoryProtocol.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 28.03.2024.
//

import Foundation

protocol ModuleFactoryProtocol {
    func createAuthModule() -> AuthViewController

    func createSignInModule() -> SignInViewController

    func createSignUpModule() -> SignUpViewController
    func createConfigureProfileModule(userForSignUp: UserForSignUp) -> ConfigureProfileViewController

    func createMainModule() -> MainTabBarViewController
    func createAnimeListModule() -> AnimeListViewController
    func createSearchModule() -> SearchViewController
    func createCalendarModule() -> CalendarViewController
    func createProfileModule() -> ProfileViewController
}

