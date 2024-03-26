//
//  RegistrationViewModel.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 18.03.2024.
//

import Foundation
import FirebaseAuth

class SignUpViewModel {

    // MARK: - Variables
    var errorStringFormatted: Observable<String>
    var userForSingUp: Observable<UserForSignUp>
    private var email: String
    private var password: String
    private var validatorService: ValidatorService

    // MARK: - Init
    init() {
        errorStringFormatted = Observable("")
        userForSingUp = Observable(UserForSignUp(id: "", login: "", email: "", password: ""))
        validatorService = ValidatorService()
        password = ""
        email = ""
    }

    // MARK: - Functions
    func validateUser(_ email: String?, _ password: String?, _ passwordConfirmation: String?) {
        guard let email, let password, let passwordConfirmation else { return }
        self.email = email
        self.password = password

        errorStringFormatted.value = ""
        let validationErrors = validatorService.validateUser(email, password, passwordConfirmation)

        if validationErrors.isEmpty {
            userForSingUp.value = UserForSignUp(id: "", login: "", email: email, password: password)
        } else {
            formatErrors(validationErrors)
        }
    }

    private func formatErrors(_ errors: [String]) {
        errors.forEach { error in
            errorStringFormatted.value += "\(error)\n"
        }
    }
}
