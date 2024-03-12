//
//  FlowController.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 12.03.2024.
//

import Foundation

protocol FlowController {

    associatedtype OutValue
    var complitionHandler: ((OutValue) -> Void)? { get set }
}
