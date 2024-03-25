//
//  LoginViewController.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 18.03.2024.
//

import UIKit

final class SignInViewController: UIViewController, FlowController {

    // MARK: - UI elements
    private lazy var emailTextField: UITextField = {
        let textField = textFieldFactory.createTextField(placeholder: Strings.TextFields.emailPlaceholder)
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .next
        textField.delegate = self

        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = textFieldFactory.createTextField(placeholder: Strings.TextFields.passwordPlaceholder)
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

    private lazy var signInButton: UIButton = {
        let action = UIAction { [weak self] _ in
            guard let self else { return }
            self.viewModel.signInUser(
                email: self.emailTextField.text,
                password: self.passwordTextField.text
            )
        }
        let button = buttonFactory.createButton(
            title: Strings.Buttons.signIn,
            action: action
        )

        return button
    }()

    // MARK: - Variables
    var completionHandler: (() -> Void)?
    private var viewModel: SignInViewModel
    private let textFieldFactory = TextFieldFactory()
    private let buttonFactory = ButtonFactory()
    private let alertFactory = AlertFactory()

    // MARK: - Init
    init(viewModel: SignInViewModel) {
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

extension SignInViewController {

    private func setupView() {
        view.backgroundColor = UIColor.background
        navigationItem.title = Strings.Titles.signIn
        configureUI()
    }

    private func configureUI() {
        let stackView = UIStackView(arrangedSubviews: [
            emailTextField,
            passwordTextField
        ])

        stackView.axis = .vertical
        stackView.spacing = 20
        addSubviews(stackView, validationErrorsLabel, signInButton)

        stackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(
                LayoutConstants.SignInView.StackView.horizontalInset
            )
        }

        validationErrorsLabel.snp.makeConstraints { make in
            make.left.equalTo(stackView.snp.left)
            make.top.equalTo(stackView.snp.bottom).offset(
                LayoutConstants.SignInView.ValidationErrorsLabel.topOffset
            )
            make.width.equalTo(emailTextField)
        }

        signInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(emailTextField)
            make.bottom.equalToSuperview().inset(
                LayoutConstants.SignInView.SignInButton.bottomOffset
            )
        }
    }

    private func setupBindings() {
        viewModel.validationError.bind { [weak self] (validationError) in
            guard let self else { return }
            self.validationErrorsLabel.text = validationError
        }

        viewModel.isSuccessfullyLoggedIn.bind { [weak self] (isSuccessfullyLoggedIn) in
            guard let self else { return }
            if isSuccessfullyLoggedIn {
                self.completionHandler?()
            } else {
                self.showLoginErrorAlert()
            }
        }
    }
}

extension SignInViewController {
    private func showLoginErrorAlert() {
        let alert = alertFactory.createErrorAlert(message: Strings.Alerts.Messages.signInErrorAlert)
        present(alert, animated: true)
    }
}

extension SignInViewController: UITextFieldDelegate {
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
