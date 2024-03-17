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
}
