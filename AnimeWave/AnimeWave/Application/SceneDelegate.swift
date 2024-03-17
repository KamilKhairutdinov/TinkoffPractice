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
        let router = Router(rootController: UINavigationController())
        appCoordinator = CoordinatorFactory().createAppCoordinator(router: router)

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = router.presenter()

        appCoordinator?.start()
        window?.makeKeyAndVisible()
    }

}

