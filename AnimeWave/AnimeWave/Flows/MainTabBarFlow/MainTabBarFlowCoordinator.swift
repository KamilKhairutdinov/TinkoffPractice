//
//  MainTabbarFlowCoordinator.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 18.03.2024.
//

import Foundation

class MainTabBarFlowCoordinator: BaseCoordinator {

    var tabBatFlow: TabBarFlowDelegate

    init(controller: TabBarFlowDelegate) {
        self.tabBatFlow = controller
    }

    override func start() {
        
    }
}
