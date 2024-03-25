//
//  FlowController.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 18.03.2024.
//

import Foundation

protocol FlowController: AnyObject {
    var completionHandler: (() -> Void)? { get set }
}
