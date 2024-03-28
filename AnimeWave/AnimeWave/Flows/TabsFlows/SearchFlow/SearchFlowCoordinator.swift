//
//  SearchFlowCoordinator.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 19.03.2024.
//

import UIKit

class SearchFlowCoordinator: BaseCoordinator {

    // MARK: - Variables
    private var router: Router

    // MARK: - Init
    init(router: Router) {
        self.router = router
    }

    // MARK: - Functions
    override func start() {
        showSearchViewController()
    }

    private func showSearchViewController() {
        let searchViewController = moduleFactory.createSearchModule()
        router.setRootController(searchViewController)
    }
}
