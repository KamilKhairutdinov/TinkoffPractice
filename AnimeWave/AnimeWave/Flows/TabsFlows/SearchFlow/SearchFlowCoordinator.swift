//
//  SearchFlowCoordinator.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 19.03.2024.
//

import UIKit

class SearchFlowCoordinator: BaseCoordinator {

    var router: Router

    init(router: Router) {
        self.router = router
    }

    override func start() {
        showSearchViewController()
    }

    private func showSearchViewController() {
        let searchViewController = SearchViewController()
        router.setRootController(searchViewController)
    }
}
