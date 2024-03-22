//
//  LoginViewModal.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 18.03.2024.
//

import Foundation

class SignInViewModel {

    // MARK: - Variables
    var validationError: Observable<String>
    var isSuccessfullyLoggedIn: Observable<Bool>
    private let authService: AuthService

    // MARK: - Init
    init() {
        validationError = Observable("")
        isSuccessfullyLoggedIn = Observable(false)
        authService = AuthService.shared
    }

    // MARK: - Functions
    func signInUser(email: String?, password: String?) {
        guard let email, let password else { return }
        validationError.value = ""
        if email.count == 0 || password.count == 0 {
            validationError.value = Strings.Errors.signInValidationError
        } else {
            authService.signIn(email: email, password: password) { [weak self] result in
                guard let self else { return }
                switch result {
                case .success:
                    self.isSuccessfullyLoggedIn.value = true
                case .failure(let error):
                    print(error)
                    self.isSuccessfullyLoggedIn.value = false
                }
            }
        }
    }

}
