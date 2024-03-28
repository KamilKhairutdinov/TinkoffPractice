//
//  UserForSignUp.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 25.03.2024.
//

import Foundation

enum UserFields {
    static let id = "id"
    static let login = "login"
    static let email = "email"
}

struct UserForSignUp: Identifiable {
    var id: String
    var login: String
    var email: String
    var password: String

    var representation: [String: String] {
        var representation: [String: String] = .init()
        representation[UserFields.id] = self.id
        representation[UserFields.login] = self.login
        representation[UserFields.email] = self.email

        return representation
    }

    static let empty: UserForSignUp = UserForSignUp(id: "", login: "", email: "", password: "")
}
