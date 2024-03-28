//
//  ProfileFlowCoordinator.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 19.03.2024.
//

import UIKit

class ProfileFlowCoordinator: BaseCoordinator {

    // MARK: - Variables
    private var router: Router

    // MARK: - Init
    init(router: Router) {
        self.router = router
    }

    // MARK: - Functions
    override func start() {
        showProfileViewController()
    }

    private func showProfileViewController() {
        let profileViewController = moduleFactory.createProfileModule()
        router.setRootController(profileViewController)
    }
}
