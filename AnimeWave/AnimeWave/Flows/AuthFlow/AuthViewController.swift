//
//  StartViewController.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 17.03.2024.
//

import UIKit
import SnapKit

enum StartViewControllerStates {
    case auth, register
}

class AuthViewController: UIViewController, FlowControllerWithValue {

    // MARK: - UI elements
    private lazy var logoImageView: UIImageView = {
        let imageView         = UIImageView(image: UIImage(named: "AnimeWaveLogo"))
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    private lazy var loginButton: UIButton = {
        let action = UIAction { [weak self] _ in
            self?.complitionHandler?(.auth)
        }
        let button = buttonFactory.createButton(title: "login_button".localized, action: action)

        return button
    }()

    private lazy var registerButton: UIButton = {
        let action = UIAction { [weak self] _ in
            self?.complitionHandler?(.register)
        }
        let button = buttonFactory.createButton(title: "register_button".localized, action: action)

        return button
    }()

    // MARK: - Variables
    let buttonFactory = ButtonFactory()
    var complitionHandler: ((StartViewControllerStates) -> Void)?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setuoView()
    }
}

extension AuthViewController {
    private func setuoView() {
        view.backgroundColor = UIColor.background
        addSubviews(logoImageView, loginButton, registerButton)
        configureUI()
    }

    private func configureUI() {
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(view.frame.height / 3)
        }

        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(registerButton)
            make.bottom.equalTo(logoImageView).offset(70)
            make.height.equalTo(35)
        }

        registerButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginButton.snp_bottomMargin).offset(25)
            make.height.equalTo(35)
        }
    }
}
