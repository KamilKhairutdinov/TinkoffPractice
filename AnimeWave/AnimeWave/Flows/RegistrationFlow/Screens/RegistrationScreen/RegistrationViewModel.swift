//
//  RegistrationViewModel.swift
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
}

class RegistrationViewModel {

    var currentUser: User
    var isValid: Observable<Bool>
    var validationErrors: [ValidationError]
    var errorStringFormatted: Observable<String>

    init() {
        self.currentUser = User()
        self.isValid = Observable(false)
        errorStringFormatted = Observable("")
        validationErrors = []
    }

    func validateUser(_ email: String?, _ password: String?) {
        guard let email, let password else { return }
        errorStringFormatted.value = ""

        if email.count == 0 {
            validationErrors.append(.emptyEmailField)
        }

        if password.count == 0 {
            validationErrors.append(.emptyPasswordField)
        }

        if !validationErrors.isEmpty {
            formatErrors(validationErrors)
            return
        } else {
            if !isValidEmail(email) {
                validationErrors.append(.incorrectEmail)
            }

            if !isValidPassword(password) {
                validationErrors.append(.incorrectPasswordLenght)
            }
            formatErrors(validationErrors)
        }
    }

    private func formatErrors(_ error: [ValidationError]) {
        isValid.value = validationErrors.isEmpty
        print(validationErrors)
        error.forEach { error in
            errorStringFormatted.value += "\(error.rawValue.localized)\n"
        }

        validationErrors = []
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    private func isValidPassword(_ password: String) -> Bool {
        return password.count > 3
    }

}
