//
//  MainTabBarViewController.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 11.03.2024.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        setupTabBar()
    }

}

extension MainTabBarViewController {

    private func setupTabs() {

        setViewControllers([
            createController(imageName: "house", title: "Anime", controller: AnimeListViewController()),
            createController(imageName: "magnifyingglass", title: "Search", controller: SearchViewController()),
            createController(imageName: "calendar", title: "Calendar", controller: CalendarViewController()),
            createController(imageName: "person", title: "Profile", controller: ProfileViewController())
        ], animated: true)
    }

    private func createController(
        imageName: String,
        title: String,
        controller: UIViewController
    ) -> UINavigationController {

        let navigationCntroller = UINavigationController(rootViewController: controller)
        navigationCntroller.tabBarItem.image = UIImage(systemName: imageName)
        navigationCntroller.viewControllers.first?.title = title

        return navigationCntroller
    }

    private func setupTabBar() {

        tabBar.tintColor = .customDarkPink
        tabBar.unselectedItemTintColor = .customPink
    }
}
