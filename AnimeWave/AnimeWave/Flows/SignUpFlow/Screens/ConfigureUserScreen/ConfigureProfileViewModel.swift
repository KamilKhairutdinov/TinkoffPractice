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
    private var firebaseService: FirestoreServire
    private var storageService: StorageService
    private var validatorService: ValidatorService
    private var occurredErrorWhileDataSet: Bool

    // MARK: - Init
    init(userForSignUp: UserForSignUp) {
        authService = AuthService.shared
        firebaseService = FirestoreServire.shared
        storageService = StorageService.shared
        validatorService = ValidatorService()
        isSuccessfulSignUp = Observable(false)
        loginValidationError = Observable("")
        isLoadingData = Observable(false)
        occurredErrorWhileDataSet = false
        self.userForSignUp = userForSignUp
    }

    // MARK: - Functions
    func signUpUser(login: String?, imageData: Data?) {
        isLoadingData.value = true
        guard let login else { return }
        guard let imageData else { return }

        let validationError = validatorService.validateLogin(login: login)
        if validationError.isEmpty {
            authService.signUp(email: userForSignUp.email, password: userForSignUp.password) { [weak self] result in
                guard let self else { return }
                switch result {
                case .success:
                    self.setUserData(login: login)
                    self.setUserAvatar(imageData: imageData)
                    self.isLoadingData.value = false

                    if occurredErrorWhileDataSet {
                        self.isSuccessfulSignUp.value = false
                    } else {
                        self.isSuccessfulSignUp.value = true
                    }
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

    private func setUserAvatar(imageData: Data) {
        storageService.uploadAvatar(userId: userForSignUp.id, imageData: imageData) { result in
            switch result {
            case .success:
                break
            case .failure(let error):
                self.occurredErrorWhileDataSet = true
                print(error.localizedDescription)
            }
        }
    }

    private func setUserData(login: String) {
        guard let currentUser = authService.currentUser else { return }
        userForSignUp.id = currentUser.uid
        userForSignUp.login = login

        firebaseService.setUsetData(user: userForSignUp) { result in
            switch result {
            case .success:
                break
            case .failure(let error):
                self.occurredErrorWhileDataSet = true
                print(error.localizedDescription)
            }
        }
    }
}
