//
//  CoordinatorFactory.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 17.03.2024.
//

import Foundation

class CoordinatorFactory: CoordinatorFactoryProtocol {

    func createAppCoordinator(router: Router) -> AppCoordinator {
        AppCoordinator(router: router)
    }

    func createAuthCoordinator(router: Router) -> AuthFlowCoordinator {
        AuthFlowCoordinator(router: router)
    }

    func createSignUpCoordinator(router: Router) -> SignUpFlowCoordinator {
        SignUpFlowCoordinator(router: router)
    }

    func createSignInCoordinator(router: Router) -> SignInFLowCoordinator {
        SignInFLowCoordinator(router: router)
    }

    func createMainTabBarCoordinator(controller: TabBarFlowDelegate) -> MainTabBarFlowCoordinator {
        MainTabBarFlowCoordinator(controller: controller)
    }

    func createAnimeListCoordinator(router: Router) -> AnimeListCoordinator {
        AnimeListCoordinator(router: router)
    }

    func createSearchCoordinator(router: Router) -> SearchFlowCoordinator {
        SearchFlowCoordinator(router: router)
    }

    func createCalendarCoordinator(router: Router) -> CalendarFlowCoordinator {
        CalendarFlowCoordinator(router: router)
    }

    func createProfileCoordinator(router: Router) -> ProfileFlowCoordinator {
        ProfileFlowCoordinator(router: router)
    }

}
