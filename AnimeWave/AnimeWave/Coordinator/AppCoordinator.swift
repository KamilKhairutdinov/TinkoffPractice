//
//  AppCoordinator.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 12.03.2024.
//

import UIKit

class AppCoordinator: Coordinator {

    // MARK: - Variales
    var naviagationController: UINavigationController
    var flowComplitionHandler: CoordinatorHandler?
    private var mainTabBarController = UITabBarController()

    // MARK: - Init
    init(naviagationController: UINavigationController) {
        self.naviagationController = naviagationController
    }

    // MARK: - Functions
    func start() {
        setupTabs()
        setupTabBar()

        naviagationController.pushViewController(mainTabBarController, animated: true)
        naviagationController.setNavigationBarHidden(true, animated: false)
    }

    private func setupTabs() {
        mainTabBarController.setViewControllers([
            setupControllerForTabBar(imageName: "house", title: "Anime", controller: AnimeListViewController()),
            setupControllerForTabBar(imageName: "magnifyingglass", title: "Search", controller: SearchViewController()),
            setupControllerForTabBar(imageName: "calendar", title: "Calendar", controller: CalendarViewController()),
            setupControllerForTabBar(imageName: "person", title: "Profile", controller: ProfileViewController())
        ], animated: true)
    }

    private func setupControllerForTabBar(imageName: String, title: String, controller: UIViewController) -> UINavigationController {

        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.tabBarItem.image = UIImage(systemName: imageName)
        navigationController.viewControllers.first?.navigationItem.title = title

        return navigationController
    }

    private func setupTabBar() {
        mainTabBarController.tabBar.tintColor = .customDarkPink
        mainTabBarController.tabBar.unselectedItemTintColor = .customPink
    }
}

