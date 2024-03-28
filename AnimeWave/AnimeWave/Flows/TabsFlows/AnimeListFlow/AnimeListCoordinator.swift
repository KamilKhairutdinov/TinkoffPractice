//
//  AnimeListCoordinator.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 19.03.2024.
//

import UIKit

class AnimeListCoordinator: BaseCoordinator {

    // MARK: - Variables
    private var router: Router

    // MARK: - Init
    init(router: Router) {
        self.router = router
    }

    // MARK: - Functions
    override func start() {
        showAnimeListController()
    }

    private func showAnimeListController() {
        let animeListController = moduleFactory.createAnimeListModule()
        router.setRootController(animeListController)
    }
}
