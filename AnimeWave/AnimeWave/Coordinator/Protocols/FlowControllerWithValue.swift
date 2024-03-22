//
//  FlowController.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 13.03.2024.
//

import Foundation

protocol FlowControllerWithValue: AnyObject {
    associatedtype OutValue
    var completionHandler: ((OutValue) -> Void)? { get set }
}
