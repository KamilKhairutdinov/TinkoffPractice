//
//  AnimeListCoordinator.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 19.03.2024.
//

import UIKit

class AnimeListCoordinator: BaseCoordinator {

    var router: Router

    init(router: Router) {
        self.router = router
    }

    override func start() {
        showAnimeListController()
    }

    private func showAnimeListController() {
        let animeListController = moduleFactory.createAnimeListModule()
        router.setRootController(animeListController)
    }
}
