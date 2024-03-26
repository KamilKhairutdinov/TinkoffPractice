//
//  FirebaseServire.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 26.03.2024.
//

import Foundation
import FirebaseFirestore

class FirebaseServire {

    // MARK: - Variables
    static let shared = FirebaseServire()
    private let firestore = Firestore.firestore()
    private var usersReference: CollectionReference {
        return firestore.collection("users")
    }

    // MARK: - Init
    private init() { }

    // MARK: - Functions
    func setUsetData(user: UserForSignUp, completion: @escaping (Result<UserForSignUp, Error>) -> Void) {
        usersReference.document(user.id).setData(user.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
    }

    // ToDo getUserData
    // func getUserData(completion: @escaping (Result<User, Error>))
}
