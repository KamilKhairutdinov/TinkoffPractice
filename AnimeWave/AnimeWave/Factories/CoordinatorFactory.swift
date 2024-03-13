//
//  CoordinatorFactory.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 13.03.2024.
//

import UIKit

class CoordinatorFactory: CoordinatorFactoryProtocol {

    func createAppCoordinator(navigationController: UINavigationController) -> AppCoordinator {
        return AppCoordinator(navigationController: navigationController)
    }
}
