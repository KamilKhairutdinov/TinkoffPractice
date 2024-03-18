//
//  RegistrationViewModel.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 18.03.2024.
//

import Foundation
import FirebaseAuth

enum ValidationError: String {
    case incorrectEmail = "incorrect_email"
    case incorrectPasswordLenght = "incorrect_password_lenght"
    case emptyEmailField = "empty_email_field"
    case emptyPasswordField = "empty_password_field"
}

class RegistrationViewModel {

    var isSuccessfulRegistered: Observable<Bool>
    var user: AnimeWaveUser
    var errorStringFormatted: Observable<String>
    private var email: String
    private var password: String
    private var authService: AuthService
    private var validationErrors: [ValidationError]

    init() {
        isSuccessfulRegistered = Observable(false)
        errorStringFormatted = Observable("")
        validationErrors = []
        authService = AuthService.shared
        password = ""
        email = ""
        user = AnimeWaveUser(login: "", email: "", password: "", avatar: "")
    }

    func validateUser(_ email: String?, _ password: String?) {
        errorStringFormatted.value = ""
        guard let email, let password else { return }

        self.email = email
        self.password = password

        if self.email.count == 0 {
            validationErrors.append(.emptyEmailField)
        }

        if self.password.count == 0 {
            validationErrors.append(.emptyPasswordField)
        }

        if !validationErrors.isEmpty {
            formatErrors(validationErrors)
            return
        } else {
            if !isValidEmail(self.email) {
                validationErrors.append(.incorrectEmail)
            }

            if !isValidPassword(self.password) {
                validationErrors.append(.incorrectPasswordLenght)
            }
            formatErrors(validationErrors)
        }
    }

    private func formatErrors(_ error: [ValidationError]) {
        if validationErrors.isEmpty {
            authService.registerUser(email: self.email, password: self.password) { [weak self] result in
                switch result {
                case .success(let user):
                    self?.isSuccessfulRegistered.value = true
                    print(user)
                case .failure(let error):
                    self?.errorStringFormatted.value = error.localizedDescription.localized
                    self?.isSuccessfulRegistered.value = false
                }
            }
        } else {
            error.forEach { error in
                errorStringFormatted.value += "\(error.rawValue.localized)\n"
            }
            validationErrors = []
        }
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
