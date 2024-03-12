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
            setupController(imageName: "house", controller: AnimeListViewController()),
            setupController(imageName: "magnifyingglass", controller: SearchViewController()),
            setupController(imageName: "calendar", controller: CalendarViewController()),
            setupController(imageName: "person", controller: ProfileViewController())
        ], animated: true)
    }

    private func setupController(imageName: String, controller: UIViewController) -> UIViewController {

        controller.tabBarItem.image = UIImage(systemName: imageName)
        controller.title = imageName
        controller.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: imageName), style: .plain, target: nil, action: nil)

        return controller
    }

    private func setupTabBar() {

        tabBar.tintColor = .customDarkPink
        tabBar.unselectedItemTintColor = .customPink
    }
}
