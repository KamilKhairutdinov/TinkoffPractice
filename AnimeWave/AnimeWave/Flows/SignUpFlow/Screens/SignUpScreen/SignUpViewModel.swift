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
    var isSuccessfulRegistered: Observable<Bool>
    var errorStringFormatted: Observable<String>
    private var email: String
    private var password: String
    private var authService: AuthService
    private var validatorService: ValidatorService

    // MARK: - Init
    init() {
        isSuccessfulRegistered = Observable(false)
        errorStringFormatted = Observable("")
        validatorService = ValidatorService()
        authService = AuthService.shared
        password = ""
        email = ""
    }

    // MARK: - Functions
    func signUpUser(_ email: String?, _ password: String?, _ passwordConfirmation: String?) {
        guard let email, let password, let passwordConfirmation else { return }
        self.email = email
        self.password = password

        errorStringFormatted.value = ""
        let errors = validatorService.validateUser(email, password, passwordConfirmation)

        if errors.isEmpty {
            authService.signUp(email: email, password: password) { [weak self] result in
                guard let self else { return }
                switch result {
                case .success:
                    self.isSuccessfulRegistered.value = true
                case .failure(let error):
                    print(error)
                    self.errorStringFormatted.value = error.localizedDescription
                    self.isSuccessfulRegistered.value = false
                }
            }
        } else {
            formatErrors(errors)
        }
    }

    private func formatErrors(_ errors: [String]) {
        errors.forEach { error in
            errorStringFormatted.value += "\(error)\n"
        }
    }
}
