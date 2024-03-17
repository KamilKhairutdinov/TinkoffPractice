//
//  Coordinator.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 13.03.2024.
//

import UIKit

protocol Coordinator: AnyObject {

    var flowComplitionHandler: (() -> Void)? { get set }

    func start()
}
