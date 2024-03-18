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

    func createStartCoordinator(router: Router) -> StartFlowCoordinator {
        return StartFlowCoordinator(router: router)
    }

    func createRegistrationCoordinator(router: Router) -> RegistrationFlowCoordinator {
        return RegistrationFlowCoordinator(router: router)
    }

    func createLoginCoordinator(router: Router) -> LoginFLowCoordinator {
        return LoginFLowCoordinator(router: router)
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
