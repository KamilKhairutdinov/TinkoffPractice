//
//  CoordinatorFactoryProtocol.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 13.03.2024.
//

import UIKit

protocol CoordinatorFactoryProtocol {

    func createAppCoordinator(navigationController: UINavigationController) -> AppCoordinator
}
