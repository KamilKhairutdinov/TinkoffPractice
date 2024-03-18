//
//  RegistrationViewModel.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 18.03.2024.
//

import Foundation
import FirebaseAuth

class RegistrationViewModel {

    var isSuccessfulRegistered: Observable<Bool>
    var user: AnimeWaveUser
    var errorStringFormatted: Observable<String>
    private var email: String
    private var password: String
    private var authService: AuthService
    private var validatorService: ValidatorService

    init() {
        isSuccessfulRegistered = Observable(false)
        errorStringFormatted = Observable("")
        validatorService = ValidatorService()
        authService = AuthService.shared
        password = ""
        email = ""
        user = AnimeWaveUser(uid: "", login: "", email: "", avatar: "")
    }

    func validateUser(_ email: String?, _ password: String?, _ passwordConfirmation: String?) {
        guard let email, let password, let passwordConfirmation else { return }
        self.email = email
        self.password = password

        errorStringFormatted.value = ""
        formatErrors(validatorService.validateUser(email, password, passwordConfirmation))

    }

    func formatErrors(_ errors: [ValidationError]) {
        if errors.isEmpty {
            authService.registerUser(email: email, password: password) { [weak self] result in
                guard let self else { return }
                switch result {
                case .success(let user):
                    self.isSuccessfulRegistered.value = true
                    self.user.uid = user.uid
                    self.user.email = user.email ?? ""

                case .failure(let error):
                    print(error)
                    self.errorStringFormatted.value = error.localizedDescription.localized
                    self.isSuccessfulRegistered.value = false
                }
            }
        } else {
            errors.forEach { error in
                errorStringFormatted.value += "\(error.rawValue.localized)\n"
            }
        }
    }

}
