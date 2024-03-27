//
//  StorageService.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 26.03.2024.
//

import Foundation
import FirebaseStorage

class StorageService {

    // MARK: - Variables
    static let shared = StorageService()
    private var storage = Storage.storage()
    private var imageReference: StorageReference {
        storage.reference(withPath: "avatars")
    }

    // MARK: - Init
    private init() { }

    // MARK: - Functions
    func uploadAvatar(userId: String, imageData: Data, completion: @escaping(Result<String, Error>) -> Void) {
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"

        imageReference.child(userId).putData(imageData, metadata: metadata) { metadata, error in
            guard let metadata = metadata else {
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
            completion(.success(metadata.description))
        }
    }
}
