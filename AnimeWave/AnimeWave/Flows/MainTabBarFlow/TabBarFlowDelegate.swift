//
//  TabBarFlow.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 19.03.2024.
//

import UIKit

protocol TabBarFlowDelegate: AnyObject {
    var onViewDidLoad: ((UINavigationController) -> ())? { get set }
    var onAnimeListFlowSelect: ((UINavigationController) -> ())? { get set }
    var onSearchFlowSelect: ((UINavigationController) -> ())? { get set }
    var onCalendarListFlowSelect: ((UINavigationController) -> ())? { get set }
    var onProfileListFlowSelect: ((UINavigationController) -> ())? { get set }
}
