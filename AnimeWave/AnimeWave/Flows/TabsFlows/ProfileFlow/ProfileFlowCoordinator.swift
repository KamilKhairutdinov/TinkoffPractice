//
//  ProfileFlowCoordinator.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 19.03.2024.
//

import UIKit

class ProfileFlowCoordinator: BaseCoordinator {

    var router: Router

    init(router: Router) {
        self.router = router
    }

    override func start() {
        showProfileViewController()
    }

    private func showProfileViewController() {
        let profileViewController =  moduleFactory.createProfileModule()
        router.setRootController(profileViewController)
    }
}
