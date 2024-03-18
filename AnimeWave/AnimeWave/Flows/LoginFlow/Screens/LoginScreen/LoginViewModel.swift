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
    var isLogedIn: Observable<Bool>

    // MARK: - Init
    init() {
        validationError = Observable("")
        isLogedIn = Observable(false)
    }

    // MARK: - Functions
    func validateData(login: String?, password: String?) {
        guard let login, let password else { return }
        validationError.value = ""
        if login.count == 0 || password.count == 0 {
            validationError.value = "login_validation_error".localized
            isLogedIn.value = false
        } else {

        }
    }

}
