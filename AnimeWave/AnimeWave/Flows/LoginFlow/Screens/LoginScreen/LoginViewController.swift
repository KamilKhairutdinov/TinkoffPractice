//
//  LoginViewController.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 18.03.2024.
//

import UIKit

class LoginViewController: UIViewController, FlowController {

    // MARK: - UI elements
    private lazy var emailTextField: UITextField = {
        let textField           = textFieldFactory.createTextField(placeholder: "email_placeholder".localized)
        textField.keyboardType  = .emailAddress
        textField.returnKeyType = .next
        textField.delegate      = self

        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField               = textFieldFactory.createTextField(placeholder: "password_placeholder".localized)
        textField.isSecureTextEntry = true
        textField.returnKeyType     = .done
        textField.delegate          = self
        textField.passwordRules     = .none

        return textField
    }()

    private lazy var validationErrorsLabel: UILabel = {
        let label           = UILabel()
        label.textColor     = .red
        label.font          = UIFont.systemFont(ofSize: 10)
        label.numberOfLines = 0

        return label
    }()

    private lazy var loginButton: UIButton = {
        let action = UIAction { [weak self] _ in
            self?.viewModel.loginUser(
                email: self?.emailTextField.text,
                password: self?.passwordTextField.text
            )
        }
        let button = buttonFactory.createButton(title: "login_button".localized, action: action)

        return button
    }()

    // MARK: - Variables
    private var viewModel: LoginViewModel
    private let textFieldFactory = TextFieldFactory()
    private let buttonFactory = ButtonFactory()
    private let alertFactory = AlertFactory()
    var complitionHandler: (() -> Void)?

    // MARK: - Init
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBindings()
    }
}

extension LoginViewController {

    private func setupView() {
        view.backgroundColor = UIColor.background
        navigationItem.title = "login_title".localized
        configureUI()
    }

    private func configureUI() {
        let stackView = UIStackView(arrangedSubviews: [
            emailTextField,
            passwordTextField
        ])

        stackView.axis = .vertical
        stackView.spacing = 20
        addSubviews(stackView, validationErrorsLabel, loginButton)

        stackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(50)
        }

        validationErrorsLabel.snp.makeConstraints { make in
            make.left.equalTo(stackView.snp_leftMargin)
            make.top.equalTo(stackView.snp_bottomMargin).offset(10)
            make.width.equalTo(emailTextField)
        }

        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(emailTextField)
            make.bottom.equalToSuperview().inset(50)
        }
    }

    private func setupBindings() {
        viewModel.validationError.bind { [weak self] (validationError) in
            self?.validationErrorsLabel.text = validationError
        }

        viewModel.isSuccessfullyLoggedIn.bind { [weak self] (isSuccessfullyLoggedIn) in
            if isSuccessfullyLoggedIn {
                self?.complitionHandler?()
            } else {
                self?.showLoginErrorAlert()
            }
        }
    }
}

extension LoginViewController {
    private func showLoginErrorAlert() {
        let alert = alertFactory.createErrorAlert(message: "login_error_alert".localized)
        present(alert, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            view.endEditing(true)
        default:
            break
        }
        return true
    }
}
