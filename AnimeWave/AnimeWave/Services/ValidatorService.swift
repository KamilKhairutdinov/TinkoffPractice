//
//  ValidatorService.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 18.03.2024.
//

import Foundation

class ValidatorService {

    // MARK: - Variables
    private var validationErrors: [String]

    // MARK: - Init
    init() {
        validationErrors = []
    }

    // MARK: - Functions
    func validateUser(_ email: String, _ password: String, _ passwordConfirmation: String) -> [String] {
        validationErrors = []

        if email.count == 0 {
            validationErrors.append(Strings.Errors.emptyEmailField)
        }

        if password.count == 0 {
            validationErrors.append(Strings.Errors.emptyPasswordField)
        }

        if !validationErrors.isEmpty {
            return validationErrors
        } else {
            if !isValidEmail(email) {
                validationErrors.append(Strings.Errors.incorrectEmail)
            }

            if !isValidPassword(password) {
                validationErrors.append(Strings.Errors.incorrectPasswordLenght)
            }

            if password != passwordConfirmation {
                validationErrors.append(Strings.Errors.passwordsDontMatch)
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
