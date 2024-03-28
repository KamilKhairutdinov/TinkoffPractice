//
//  LoginViewModal.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 18.03.2024.
//

import Foundation

class SignInViewModel {

    // MARK: - Variables
    var isSuccessfullyLoggedIn: Observable<Bool>
    var isLoadingData: Observable<Bool>
    var validationError: Observable<String>
    var firebaseError: Observable<String>
    private let authService: AuthService

    // MARK: - Init
    init() {
        isSuccessfullyLoggedIn = Observable(false)
        isLoadingData = Observable(false)
        validationError = Observable("")
        firebaseError = Observable("")

        authService = AuthService.shared
    }

    // MARK: - Functions
    func signInUser(email: String?, password: String?) {
        guard let email, let password else { return }
        validationError.value = ""
        if email.isEmpty || password.isEmpty {
            validationError.value = Strings.Errors.signInValidationError
        } else {
            isLoadingData.value = true
            authService.signIn(email: email, password: password) { [weak self] result in
                guard let self else { return }
                switch result {
                case .success:
                    self.isLoadingData.value = false
                    self.isSuccessfullyLoggedIn.value = true
                case .failure(let error):
                    firebaseError.value = error.localizedDescription
                    self.isLoadingData.value = false
                }
            }
        }
    }

}
