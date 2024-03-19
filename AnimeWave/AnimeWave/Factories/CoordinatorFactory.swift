//
//  CoordinatorFactory.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 17.03.2024.
//

import Foundation

class CoordinatorFactory: CoordinatorFactoryProtocol {
    func createAppCoordinator(router: Router) -> AppCoordinator {
        return AppCoordinator(router: router)
    }

    func createAuthCoordinator(router: Router) -> AuthFlowCoordinator {
        return AuthFlowCoordinator(router: router)
    }

    func createSignUpCoordinator(router: Router) -> SignUpFlowCoordinator {
        return SignUpFlowCoordinator(router: router)
    }

    func createSignInCoordinator(router: Router) -> SignInFLowCoordinator {
        return SignInFLowCoordinator(router: router)
    }

    func createMainTabBarCoordinator(controller: TabBarFlowDelegate) -> MainTabBarFlowCoordinator {
        return MainTabBarFlowCoordinator(controller: controller)
    }

    func createAnimeListCoordinator(router: Router) -> AnimeListCoordinator {
        return AnimeListCoordinator(router: router)
    }

    func createSearchCoordinator(router: Router) -> SearchFlowCoordinator {
        return SearchFlowCoordinator(router: router)
    }

    func createCalendarCoordinator(router: Router) -> CalendarFlowCoordinator {
        return CalendarFlowCoordinator(router: router)
    }

    func createProfileCoordinator(router: Router) -> ProfileFlowCoordinator {
        return ProfileFlowCoordinator(router: router)
    }

}
