//
//  CoordinatorFactoryProtocol.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 17.03.2024.
//

import Foundation

protocol CoordinatorFactoryProtocol {
    func createAppCoordinator(router: Router) -> AppCoordinator
}
