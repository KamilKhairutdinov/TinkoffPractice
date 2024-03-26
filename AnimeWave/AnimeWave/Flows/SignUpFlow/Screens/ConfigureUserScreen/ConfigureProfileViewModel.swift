//
//  ConfigureUserViewModel.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 18.03.2024.
//

import Foundation

class ConfigureProfileViewModel {

    // MARK: - Variables
    var isSuccessfulSignUp: Observable<Bool>
    var isLoadingData: Observable<Bool>
    var loginValidationError: Observable<String>
    private var userForSignUp: UserForSignUp
    private var authService: AuthService
    private var firebaseService: FirebaseServire
    private var validatorService: ValidatorService

    // MARK: - Init
    init(userForSignUp: UserForSignUp) {
        authService = AuthService.shared
        firebaseService = FirebaseServire.shared
        validatorService = ValidatorService()
        isSuccessfulSignUp = Observable(false)
        loginValidationError = Observable("")
        isLoadingData = Observable(false)
        self.userForSignUp = userForSignUp
    }

    // MARK: - Functions
    func signUpUser(login: String?) {
        guard let login else { return }
        isLoadingData.value = true
        let validationError = validatorService.validateLogin(login: login)

        if validationError.isEmpty {
            authService.signUp(email: userForSignUp.email, password: userForSignUp.password) { [weak self] result in
                guard let self else { return }
                switch result {
                case .success:
                    self.setUserData(login: login)
                    self.isLoadingData.value = false
                case .failure(let error):
                    self.isLoadingData.value = false
                    self.isSuccessfulSignUp.value = false
                    print(error.localizedDescription)
                }
            }
        } else {
            isLoadingData.value = false
            loginValidationError.value = validationError
        }
    }

    private func setUserData(login: String) {
        guard let currentUser = authService.currentUser else { return }
        userForSignUp.id = currentUser.uid
        userForSignUp.login = login

        firebaseService.setUsetData(user: userForSignUp) { result in
            switch result {
            case .success:
                self.isSuccessfulSignUp.value = true
            case .failure(let error):
                self.isSuccessfulSignUp.value = false
                print(error.localizedDescription)
            }
        }
    }
}
