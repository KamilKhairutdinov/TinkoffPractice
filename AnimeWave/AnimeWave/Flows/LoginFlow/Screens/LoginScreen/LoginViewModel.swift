//
//  LoginViewModal.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 18.03.2024.
//

import Foundation

class LoginViewModel {

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
    func loginUser(email: String?, password: String?) {
        guard let email, let password else { return }
        validationError.value = ""
        if email.count == 0 || password.count == 0 {
            validationError.value = "login_validation_error".localized
        } else {
            authService.login(email: email, password: password) { [weak self] result in
                switch result {
                case .success:
                    self?.isSuccessfullyLoggedIn.value = true
                case .failure(let error):
                    print(error)
                    self?.isSuccessfullyLoggedIn.value = false
                }
            }
        }
    }

}
