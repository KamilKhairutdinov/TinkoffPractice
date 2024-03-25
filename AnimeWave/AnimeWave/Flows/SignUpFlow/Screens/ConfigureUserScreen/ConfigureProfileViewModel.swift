//
//  ConfigureUserViewModel.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 18.03.2024.
//

import Foundation
import FirebaseAuth

class ConfigureProfileViewModel {

    // MARK: - Variables
    var authService: AuthService

    // MARK: - Init
    init() {
        authService = AuthService.shared
    }
}
