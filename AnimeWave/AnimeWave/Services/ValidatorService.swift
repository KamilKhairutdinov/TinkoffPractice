//
//  ValidatorService.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 18.03.2024.
//

import Foundation

enum ValidationError: String {
    case incorrectEmail = "incorrect_email"
    case incorrectPasswordLenght = "incorrect_password_lenght"
    case emptyEmailField = "empty_email_field"
    case emptyPasswordField = "empty_password_field"
    case passwordDontMatch = "passwords_dont_match"
}

class ValidatorService {

    // MARK: - Variables
    private var validationErrors: [ValidationError]

    // MARK: - Init
    init() {
        validationErrors = []
    }

    // MARK: - Functions
    func validateUser(_ email: String, _ password: String, _ passwordConfirmation: String) -> [ValidationError] {
        validationErrors = []

        if email.count == 0 {
            validationErrors.append(.emptyEmailField)
        }

        if password.count == 0 {
            validationErrors.append(.emptyPasswordField)
        }

        if !validationErrors.isEmpty {
            return validationErrors
        } else {
            if !isValidEmail(email) {
                validationErrors.append(.incorrectEmail)
            }

            if !isValidPassword(password) {
                validationErrors.append(.incorrectPasswordLenght)
            }

            if password != passwordConfirmation {
                validationErrors.append(.passwordDontMatch)
            }
            return validationErrors
        }
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    private func isValidPassword(_ password: String) -> Bool {
        return password.count > 6
    }
}
