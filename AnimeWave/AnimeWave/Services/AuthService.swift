//
//  AuthService.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 17.03.2024.
//

import Foundation

class AuthService {

    let userDefaults = UserDefaults.standard
    static let shared = AuthService()

    private init() { }
}
