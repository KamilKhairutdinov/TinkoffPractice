//
//  RegistrationViewController.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 18.03.2024.
//

import UIKit
import Combine

class SignUpViewController: UIViewController, FlowController {

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
        textField.returnKeyType     = .next
        textField.delegate          = self
        textField.passwordRules     = .none

        return textField
    }()

    private lazy var passwordConfirmationTextField: UITextField = {
        let textField               = textFieldFactory.createTextField(placeholder: "password_confirmation_placeholder".localized)
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

    private lazy var nextButton: UIButton = {
        let action = UIAction { [weak self] _ in
            self?.viewModel.validateUser(
                self?.emailTextField.text,
                self?.passwordTextField.text,
                self?.passwordConfirmationTextField.text
            )
        }
        let button = buttonFactory.createButton(title: "next_button".localized, action: action)

        return button
    }()

    // MARK: - Variables
    private let textFieldFactory = TextFieldFactory()
    private let buttonFactory = ButtonFactory()
    private let viewModel: SignUpViewModel
    var complitionHandler: (() -> Void)?

    // MARK: - Init
    init(viewModel: SignUpViewModel) {
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

extension SignUpViewController {
    private func setupView() {
        view.backgroundColor = UIColor.background
        navigationItem.title = "registration_title".localized
        configureUI()
    }

    private func configureUI() {
        let stackView = UIStackView(arrangedSubviews: [
            emailTextField,
            passwordTextField,
            passwordConfirmationTextField
        ])

        stackView.axis = .vertical
        stackView.spacing = 20
        addSubviews(stackView, nextButton, validationErrorsLabel)

        stackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(50)
        }

        validationErrorsLabel.snp.makeConstraints { make in
            make.left.equalTo(stackView.snp_leftMargin)
            make.top.equalTo(stackView.snp_bottomMargin).offset(10)
            make.width.equalTo(emailTextField)
        }

        nextButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(emailTextField)
            make.bottom.equalToSuperview().inset(50)
        }
    }

    private func setupBindings() {
        viewModel.isSuccessfulRegistered.bind({ [weak self] (isSuccessfulRegistered) in
            if isSuccessfulRegistered {
                self?.complitionHandler?()
            }
        })

        viewModel.errorStringFormatted.bind({ [weak self] (errorStringFormatted) in
            self?.validationErrorsLabel.text = errorStringFormatted
        })
    }
}

extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordConfirmationTextField.becomeFirstResponder()
        case passwordConfirmationTextField:
            view.endEditing(true)
        default:
            break
        }
        return true
    }
}
