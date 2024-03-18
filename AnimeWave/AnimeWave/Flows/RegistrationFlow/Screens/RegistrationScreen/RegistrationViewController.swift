//
//  RegistrationViewController.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 18.03.2024.
//

import UIKit
import Combine

class RegistrationViewController: UIViewController {

    // MARK: - UI elements
    private lazy var emailTextField: UITextField = {
        let textField = textFieldFactory.createTextField(placeholder: "email_placeholder".localized)
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .next
        textField.delegate = self

        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = textFieldFactory.createTextField(placeholder: "password_placeholder".localized)
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
            self?.viewModel.validateUser(self?.emailTextField.text, self?.passwordTextField.text)
        }
        let button = buttonFactory.createButton(title: "next_button".localized, action: action)

        return button
    }()

    // MARK: - Variables
    private let textFieldFactory = TextFieldFactory()
    private let buttonFactory = ButtonFactory()
    private let viewModel: RegistrationViewModel

    // MARK: - Init
    init(viewModel: RegistrationViewModel) {
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

extension RegistrationViewController {
    private func setupView() {
        view.backgroundColor = UIColor.background
        navigationItem.title = "registration_title".localized
        configureUI()
        setupBindings()
    }

    private func configureUI() {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField])

        stackView.axis = .vertical
        stackView.spacing = 20
        addSubviews(stackView, nextButton, validationErrorsLabel)

        stackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(view.frame.width / 3 * 2)
        }

        validationErrorsLabel.snp.makeConstraints { make in
            make.left.equalTo(stackView.snp_leftMargin)
            make.top.equalTo(stackView.snp_bottomMargin).offset(10)
        }

        nextButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(stackView.snp_bottomMargin).offset(50)
            make.height.equalTo(passwordTextField)
        }
    }

    private func setupBindings() {
        viewModel.isValid.bind({ (value) in
            print(value)
        })

        viewModel.errorStringFormatted.bind({ [weak self] (value) in
            self?.validationErrorsLabel.text = value
        })
    }
}

extension RegistrationViewController: UITextFieldDelegate {
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
