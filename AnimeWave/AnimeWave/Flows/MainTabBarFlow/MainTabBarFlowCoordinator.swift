//
//  MainTabbarFlowCoordinator.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 18.03.2024.
//

import UIKit

class MainTabBarFlowCoordinator: BaseCoordinator {

    // MARK: - Variables
    private var tabBatFlowDelegate: TabBarFlowDelegate

    // MARK: - Init
    init(controller: TabBarFlowDelegate) {
        self.tabBatFlowDelegate = controller
    }

    // MARK: - Functions
    override func start() {
        tabBatFlowDelegate.onViewDidAppear = runAnimeListFlow()
        tabBatFlowDelegate.onAnimeListFlowSelect = runAnimeListFlow()
        tabBatFlowDelegate.onSearchFlowSelect = runSearchFlow()
        tabBatFlowDelegate.onCalendarListFlowSelect = runCalendarFlow()
        tabBatFlowDelegate.onProfileListFlowSelect = runProfileFlow()
    }

    private func runAnimeListFlow() -> ((UINavigationController) -> Void) {
        return { [unowned self] navigationController in
            if navigationController.viewControllers.isEmpty {
                let animeListCoordinator = coordinatorFactory.createAnimeListCoordinator(
                    router: Router(rootController: navigationController)
                )
                self.addDependency(animeListCoordinator)
                animeListCoordinator.start()
            }
        }
    }

    private func runSearchFlow() -> ((UINavigationController) -> Void) {
        return { [unowned self] navigationController in
            if navigationController.viewControllers.isEmpty {
                let searchFlowCoordinator = coordinatorFactory.createSearchCoordinator(
                    router: Router(rootController: navigationController)
                )
                self.addDependency(searchFlowCoordinator)
                searchFlowCoordinator.start()
            }
        }
    }

    private func runCalendarFlow() -> ((UINavigationController) -> Void) {
        return { [unowned self] navigationController in
            if navigationController.viewControllers.isEmpty {
                let calendarFlowCoordiantor = coordinatorFactory.createCalendarCoordinator(
                    router: Router(rootController: navigationController)
                )
                self.addDependency(calendarFlowCoordiantor)
                calendarFlowCoordiantor.start()
            }
        }
    }

    private func runProfileFlow() -> ((UINavigationController) -> Void) {
        return { [unowned self] navigationController in
            if navigationController.viewControllers.isEmpty {
                let profileFlowCoordinator = coordinatorFactory.createProfileCoordinator(
                    router: Router(rootController: navigationController)
                )
                self.addDependency(profileFlowCoordinator)
                profileFlowCoordinator.start()
            }
        }
    }
}
