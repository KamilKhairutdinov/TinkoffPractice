//
//  CalendarFlowCoordinator.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 19.03.2024.
//

import UIKit

class CalendarFlowCoordinator: BaseCoordinator {

    // MARK: - Variables
    private var router: Router

    // MARK: - Init
    init(router: Router) {
        self.router = router
    }

    // MARK: - Functions
    override func start() {
        showCalendarViewController()
    }

    private func showCalendarViewController() {
        let calendarViewController = moduleFactory.createCalendarModule()
        router.setRootController(calendarViewController)
    }
}
