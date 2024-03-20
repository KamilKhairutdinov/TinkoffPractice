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
        let imageView = UIImageView(image: UIImage(named: "AnimeWaveLogo"))
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    private lazy var signInButton: UIButton = {
        let action = UIAction { [weak self] _ in
            guard let self else { return }
            self.complitionHandler?(.signIn)
        }
        let button = buttonFactory.createButton(title: "sign_in_button".localized, action: action)

        return button
    }()

    private lazy var signUpButton: UIButton = {
        let action = UIAction { [weak self] _ in
            guard let self else { return }
            self.complitionHandler?(.signUp)
        }
        let button = buttonFactory.createButton(title: "sign_up_button".localized, action: action)

        return button
    }()

    // MARK: - Variables
    var complitionHandler: ((AuthViewControllerStates) -> Void)?
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
            make.top.equalToSuperview().offset(view.frame.height / 3)
        }

        signInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(signUpButton)
            make.bottom.equalTo(logoImageView).offset(70)
            make.height.equalTo(35)
        }

        signUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(signInButton.snp.bottom).offset(25)
            make.height.equalTo(35)
        }
    }
}
