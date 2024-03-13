//
//  Coordinator.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 13.03.2024.
//

import UIKit

typealias FlowComplitionHandler = () -> Void

protocol Coordinator: AnyObject {

    var flowComplitionHandler: FlowComplitionHandler? { get set }

    func start()
}
