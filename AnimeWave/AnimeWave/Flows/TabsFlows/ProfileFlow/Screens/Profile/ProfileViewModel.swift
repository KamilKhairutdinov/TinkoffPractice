//
//  ProfileViewModel.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 28.03.2024.
//

import Foundation

class ProfileViewModel {

    // MARK: - Variables
    var cellViewModels: [WatchingStatusCellViewModel]

    // MARK: - Init
    init() {
        cellViewModels = [
            .init(title: Strings.Labels.watching),
            .init(title: Strings.Labels.watched),
            .init(title: Strings.Labels.postponed)
        ]
    }

    // MARK: - Functions
}
