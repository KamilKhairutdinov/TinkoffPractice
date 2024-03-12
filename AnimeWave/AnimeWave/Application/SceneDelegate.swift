//
//  SceneDelegate.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 10.03.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        appCoordinator = AppCoordinator(naviagationController: UINavigationController())
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = appCoordinator?.naviagationController
        appCoordinator?.start()
        window?.makeKeyAndVisible()
    }
}

