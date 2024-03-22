//
//  StartViewController.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 17.03.2024.
//

import UIKit
import SnapKit

enum AuthViewControllerStates {
    case signIn, signUp
}

final class AuthViewController: UIViewController, FlowControllerWithValue {

    // MARK: - UI elements
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.animeWaveLogo)
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    private lazy var signInButton: UIButton = {
        let action = UIAction { [weak self] _ in
            guard let self else { return }
            self.completionHandler?(.signIn)
        }
        let button = buttonFactory.createButton(title: Strings.Buttons.signIn, action: action)

        return button
    }()

    private lazy var signUpButton: UIButton = {
        let action = UIAction { [weak self] _ in
            guard let self else { return }
            self.completionHandler?(.signUp)
        }
        let button = buttonFactory.createButton(title: Strings.Buttons.signUp, action: action)

        return button
    }()

    // MARK: - Variables
    var completionHandler: ((AuthViewControllerStates) -> Void)?
    private let buttonFactory = ButtonFactory()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setuoView()
    }
}

extension AuthViewController {
    private func setuoView() {
        view.backgroundColor = UIColor.background
        addSubviews(logoImageView, signInButton, signUpButton)
        configureUI()
    }

    private func configureUI() {
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(
                view.frame.height * LayoutConstants.AuthView.LogoImageView.topOffsetMultiplier
            )
        }

        signInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(signUpButton)
            make.bottom.equalTo(logoImageView).offset(
                LayoutConstants.AuthView.SignInButton.bottomOffset
            )
            make.height.equalTo(LayoutConstants.buttonsHeight)
        }

        signUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(signInButton.snp.bottom).offset(
                LayoutConstants.AuthView.SignUpButton.topOffset
            )
            make.height.equalTo(LayoutConstants.buttonsHeight)
        }
    }
}
