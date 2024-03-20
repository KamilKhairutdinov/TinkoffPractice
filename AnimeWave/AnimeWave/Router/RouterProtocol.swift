//
//  RouterProtocol.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 17.03.2024.
//

import UIKit

protocol RouterProtocol {
    func present(_ controller: UIViewController, animated: Bool)

    func push(_ controller: UIViewController, animated: Bool)
    func push(_ controller: UIViewController, animated: Bool, hideBottomBar: Bool)

    func pop(animated: Bool)
    func popToRootController(animated: Bool)

    func dismiss(animated: Bool)

    func setRootController(_ controller: UIViewController, isNavigationBarHidden: Bool)
    func setRootController(_ controller: UIViewController)
}
