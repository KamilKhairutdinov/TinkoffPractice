//
//  Coordinator.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 11.03.2024.
//

import UIKit

typealias CoordinatorHandler = () -> Void

protocol Coordinator: AnyObject {

    var navigationController: UINavigationController { get set }
    var flowComplitionHandler: CoordinatorHandler? { get set }

    func start()
}
