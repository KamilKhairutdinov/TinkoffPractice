//
//  AuthService.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 17.03.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthService {

    // MARK: - Variables
    private let auth: Auth
    var currentUser: User? {
        return auth.currentUser
    }

    // MARK: - Singleton
    static let shared = AuthService()
    private init() {
        auth = Auth.auth()
    }

    // MARK: - Functions
    func signUp(
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

    func signIn(
        email: String,
        password: String,
        complition: @escaping (Result<User, Error>) -> Void
    ) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if let result = result {
                complition(.success(result.user))
            } else if let error = error {
                complition(.failure(error))
            }
        }
    }

}
