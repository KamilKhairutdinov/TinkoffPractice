//
//  ConfigureUserViewModel.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 18.03.2024.
//

import Foundation

class ConfigureUserViewModel {

    // MARK: - Variables
    var currentUser: AnimeWaveUser?

    // MARK: - Init
    init(currentUser: AnimeWaveUser?) {
        self.currentUser = currentUser
        // print(currentUser)
    }
}
