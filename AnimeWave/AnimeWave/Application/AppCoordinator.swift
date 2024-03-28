//
//  AppCoordinator.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 13.03.2024.
//

import UIKit

class AppCoordinator: BaseCoordinator {

    private var router: Router
    private let authService: AuthService
    private var isLoggedIn: Bool = false // Mock for test

    init(router: Router) {
        self.router = router
        authService = AuthService.shared
    }

    override func start() {
        if isLoggedIn {
            runMainFlow()
        } else {
            runAuthFlow()
        }
    // authService.currentUser == nil ? runAuthFlow() : runMainFlow()
    }

    private func runAuthFlow() {
        let authFlowCoordinator = coordinatorFactory.createAuthCoordinator(router: router)
        authFlowCoordinator.start()
        addDependency(authFlowCoordinator)
        authFlowCoordinator.flowCompletionHandler = { [weak self] in
            guard let self else { return }
            self.isLoggedIn = true
            self.runMainFlow()
            self.removeDependency(authFlowCoordinator)
        }
    }

    private func runMainFlow() {
        let mainTabBarViewController = moduleFactory.createMainModule()
        let mainTabBarFlowCoordinator = coordinatorFactory.createMainTabBarCoordinator(controller: mainTabBarViewController)
        addDependency(mainTabBarFlowCoordinator)
        mainTabBarFlowCoordinator.flowCompletionHandler = { [weak self] in
            guard let self else { return }
            self.removeDependency(mainTabBarFlowCoordinator)
        }
        router.setRootController(mainTabBarViewController, isNavigationBarHidden: true)
        mainTabBarFlowCoordinator.start()
    }
}
