//
//  CoordinatorFactoryProtocol.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 17.03.2024.
//

import Foundation

protocol CoordinatorFactoryProtocol {
    func createAppCoordinator(router: Router) -> AppCoordinator
    func createStartCoordinator(router: Router) -> StartFlowCoordinator
    func createRegistrationCoordinator(router: Router) -> RegistrationFlowCoordinator
    func createLoginCoordinator(router: Router) -> LoginFLowCoordinator
    func createMainTabBarCoordinator(controller: TabBarFlowDelegate) -> MainTabBarFlowCoordinator
    func createAnimeListCoordinator(router: Router) -> AnimeListCoordinator
    func createSearchCoordinator(router: Router) -> SearchFlowCoordinator
    func createCalendarCoordinator(router: Router) -> CalendarFlowCoordinator
    func createProfileCoordinator(router: Router) -> ProfileFlowCoordinator
}
