//
//  Coordinator.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 11.03.2024.
//

import UIKit

protocol Coordinator: AnyObject {

    var navigationController: UINavigationController { get set }
    func start()
}
