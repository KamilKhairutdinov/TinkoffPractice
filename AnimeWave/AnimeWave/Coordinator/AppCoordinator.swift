//
//  AppCoordinator.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 13.03.2024.
//

import UIKit

class AppCoordinator: BaseCoordinator {

    private var router: Router
    var isLogined: Bool = false

    init(router: Router) {
        self.router = router
    }

    override func start() {
        if isLogined {
            runMainFlow()
        } else {
            runStartFlow()
        }
    }

    private func runStartFlow() {
        let startFlowCoordinator = coordinatorFactory.createStartCoordinator(router: router)
        startFlowCoordinator.start()
        addDependency(startFlowCoordinator)
        startFlowCoordinator.flowComplitionHandler = { [weak self] in
            self?.runMainFlow()
            self?.removeDependency(startFlowCoordinator)
        }
    }

    private func runMainFlow() {
        let mainTabBarViewController = MainTabBarViewController()
        let mainTabBarFlowCoordinator = coordinatorFactory.createMainTabBarCoordinator(controller: mainTabBarViewController)
        addDependency(mainTabBarFlowCoordinator)
        mainTabBarFlowCoordinator.flowComplitionHandler = { [weak self] in
            self?.removeDependency(mainTabBarFlowCoordinator)
        }
        router.setRootController(mainTabBarViewController, isNavigationBarHidden: true)
        mainTabBarFlowCoordinator.start()
    }

}
