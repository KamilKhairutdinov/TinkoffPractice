//
//  AppCoordinator.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 13.03.2024.
//

import UIKit

class AppCoordinator: BaseCoordinator {

    override init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
    }

    override func start() {
        let vc = ViewController()
        navigationController.pushViewController(vc, animated: true)
    }

}
