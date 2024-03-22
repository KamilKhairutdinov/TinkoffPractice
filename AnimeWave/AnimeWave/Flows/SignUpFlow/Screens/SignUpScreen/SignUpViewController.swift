//
//  RegistrationViewController.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 18.03.2024.
//

import UIKit
import Combine

final class SignUpViewController: UIViewController, FlowController {

    // MARK: - UI elements
    private lazy var emailTextField: UITextField = {
        let textField = textFieldFactory.createTextField(placeholder: Strings.TextFields.emailPlaceholder)
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .next
        textField.delegate = self

        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = textFieldFactory.createTextField(placeholder: Strings.TextFields.loginPlaceholder)
        textField.isSecureTextEntry = true
        textField.returnKeyType = .next
        textField.delegate = self
        textField.passwordRules = .none

        return textField
    }()

    private lazy var passwordConfirmationTextField: UITextField = {
        let textField = textFieldFactory.createTextField(
            placeholder: Strings.TextFields.passwordConfirmationPlaceholder
        )
        textField.isSecureTextEntry = true
        textField.returnKeyType = .done
        textField.delegate = self
        textField.passwordRules = .none

        return textField
    }()

    private lazy var validationErrorsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 10)
        label.numberOfLines = 0

        return label
    }()

    private lazy var nextButton: UIButton = {
        let action = UIAction { [weak self] _ in
            guard let self else { return }
            self.viewModel.signUpUser(
                self.emailTextField.text,
                self.passwordTextField.text,
                self.passwordConfirmationTextField.text
            )
        }
        let button = buttonFactory.createButton(title: Strings.Buttons.next, action: action)

        return button
    }()

    // MARK: - Variables
    var complitionHandler: (() -> Void)?
    private let textFieldFactory = TextFieldFactory()
    private let buttonFactory = ButtonFactory()
    private let viewModel: SignUpViewModel

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
        navigationItem.title = Strings.Titles.signUp
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
            make.left.equalTo(stackView.snp.left)
            make.top.equalTo(stackView.snp.bottom).offset(10)
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
                guard let self else { return }
                self.complitionHandler?()
            }
        })

        viewModel.errorStringFormatted.bind({ [weak self] (errorStringFormatted) in
            guard let self else { return }
            self.validationErrorsLabel.text = errorStringFormatted
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
