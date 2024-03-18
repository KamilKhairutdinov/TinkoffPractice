//
//  AuthService.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 17.03.2024.
//

import Foundation
import FirebaseAuth

class AuthService {
    // MARK: - Variables
    private let auth: Auth
    private let userDefaults: UserDefaults

    private var currentUser: User? {
        return auth.currentUser
    }

    // MARK: - Singleton
    static let shared = AuthService()
    private init() {
        auth = Auth.auth()
        userDefaults = UserDefaults.standard
    }

    // MARK: - Functions
    func registerUser(
        email: String,
        password: String,
        complition: @escaping (Result<User, Error>) -> Void
    ) {
        auth.createUser(withEmail: email, password: password) { result, error in
            if let result = result {
                complition(.success(result.user))
            } else if let error {
                complition(.failure(error))
            }
        }
    }

}
