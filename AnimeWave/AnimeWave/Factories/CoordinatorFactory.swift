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
}
