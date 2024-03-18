//
//  MainTabBarViewController.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 19.03.2024.
//

import UIKit

class MainTabBarViewController: UITabBarController, TabBarFlowDelegate {

    // MARK: - Variales
    var onViewDidAppear: ((UINavigationController) -> Void)?
    var onAnimeListFlowSelect: ((UINavigationController) -> Void)?
    var onSearchFlowSelect: ((UINavigationController) -> Void)?
    var onCalendarListFlowSelect: ((UINavigationController) -> Void)?
    var onProfileListFlowSelect: ((UINavigationController) -> Void)?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    override func viewDidAppear(_ animated: Bool) {
        if let controller = customizableViewControllers?.first as? UINavigationController {
            onViewDidAppear?(controller)
        }
    }
}

extension MainTabBarViewController {

    private func configureView() {
        setupTabs()
        tabBar.unselectedItemTintColor = UIColor.tabs
        tabBar.tintColor = UIColor.tabsSelected
        delegate = self
        view.backgroundColor = .background
    }

    private func setupTabs() {
        setViewControllers([
            setupControllerForTabBar(imageName: "house"),
            setupControllerForTabBar(imageName: "magnifyingglass"),
            setupControllerForTabBar(imageName: "calendar"),
            setupControllerForTabBar(imageName: "person")
        ], animated: true)
    }

    private func setupControllerForTabBar(imageName: String) -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.tabBarItem.image = UIImage(systemName: imageName)

        return navigationController
    }
}

extension MainTabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let controller = viewControllers?[selectedIndex] as? UINavigationController else { return }

        switch selectedIndex {
        case 0:
            onAnimeListFlowSelect?(controller)
        case 1:
            onSearchFlowSelect?(controller)
        case 2:
            onCalendarListFlowSelect?(controller)
        case 3:
            onProfileListFlowSelect?(controller)
        default:
            fatalError("Tab bar index out of range")
        }
    }
}
