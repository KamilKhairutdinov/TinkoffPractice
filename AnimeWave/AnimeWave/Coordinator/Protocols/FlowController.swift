//
//  FlowController.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 13.03.2024.
//

import Foundation

protocol FlowController: AnyObject {

    associatedtype OutValue
    var complitionHandler: ((OutValue) -> Void)? { get set }
}
