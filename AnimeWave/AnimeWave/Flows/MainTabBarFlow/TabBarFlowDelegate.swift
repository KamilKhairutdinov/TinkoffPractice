//
//  TabBarFlow.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 19.03.2024.
//

import UIKit

protocol TabBarFlowDelegate: AnyObject {
    var onViewDidAppear: ((UINavigationController) -> Void)? { get set }
    var onAnimeListFlowSelect: ((UINavigationController) -> Void)? { get set }
    var onSearchFlowSelect: ((UINavigationController) -> Void)? { get set }
    var onCalendarListFlowSelect: ((UINavigationController) -> Void)? { get set }
    var onProfileListFlowSelect: ((UINavigationController) -> Void)? { get set }
}
