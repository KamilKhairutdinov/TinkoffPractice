//
//  ConfigureUserViewController.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 18.03.2024.
//

import UIKit
import SnapKit

final class ConfigureProfileViewController: UIViewController {

    // MARK: - UI elements
    private lazy var fillProfileLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.mainText
        label.text = Strings.Labels.fillProfileLabel

        return label
    }()

    private lazy var userAvatarImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.defaultAvatar)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = view.frame.width / 4

        return imageView
    }()

    private lazy var pickImageButton: UIButton = {
        let action = UIAction { [weak self] _ in
            guard let self else { return }
            self.present(self.avatarImagePickerController, animated: true)
        }
        let button = buttonFactory.createPlainButton(title: Strings.Buttons.pickImage, action: action)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private lazy var loginTextField: UITextField = {
        let textField = textFieldFactory.createTextField(placeholder: Strings.TextFields.loginPlaceholder)
        textField.returnKeyType = .done
        textField.delegate = self

        return textField
    }()

    private lazy var validationErrorsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 10)
        label.numberOfLines = 0

        return label
    }()

    private lazy var signUpButton: UIButton = {
        let action = UIAction { [weak self] _ in
            guard let self else { return }
            self.viewModel.signUpUser(login: self.loginTextField.text)
        }
        let button = buttonFactory.createButton(title: Strings.Buttons.signUp, action: action)
        return button
    }()

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.isHidden = true

        return activityIndicator
    }()

    // MARK: - Variables
    var complitionHandler: (() -> Void)?
    private var viewModel: ConfigureProfileViewModel
    private var buttonFactory = ButtonFactory()
    private var alertFactory = AlertFactory()
    private var textFieldFactory = TextFieldFactory()
    private lazy var avatarImagePickerController: UIImagePickerController = {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        return imagePickerController
    }()

    // MARK: - Init
    init(viewModel: ConfigureProfileViewModel) {
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
    }
}

extension ConfigureProfileViewController: UITextFieldDelegate {
    private func setupView() {
        view.backgroundColor = UIColor.background
        addSubviews(
            fillProfileLabel,
            userAvatarImageView,
            pickImageButton,
            loginTextField,
            validationErrorsLabel,
            signUpButton,
            activityIndicator
        )
        configureUI()
        setupBindings()
    }

    private func configureUI() {
        fillProfileLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(
                LayoutConstants.ConfigureProfileView.FillProfileLabel.topOffset
            )
            make.centerX.equalToSuperview()
        }

        userAvatarImageView.snp.makeConstraints { make in
            make.width.height.equalTo(
                view.frame.width * LayoutConstants.ConfigureProfileView.UserAvatarImageView.widthHeightMultiplier
            )
            make.top.equalTo(fillProfileLabel.snp.bottom).offset(
                LayoutConstants.ConfigureProfileView.UserAvatarImageView.topOffset
            )
            make.centerX.equalToSuperview()
        }

        pickImageButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(userAvatarImageView.snp.bottom).offset(
                LayoutConstants.ConfigureProfileView.PickImageButton.topOffset
            )
        }

        loginTextField.snp.makeConstraints { make in
            make.top.equalTo(pickImageButton.snp.bottom).offset(
                LayoutConstants.ConfigureProfileView.LoginTextField.topOffset
            )
            make.left.right.equalToSuperview().inset(
                LayoutConstants.ConfigureProfileView.LoginTextField.horizontalInset
            )
            make.height.equalTo(LayoutConstants.textFieldsHeight)
            make.centerX.equalToSuperview()
        }

        validationErrorsLabel.snp.makeConstraints { make in
            make.left.equalTo(loginTextField.snp.left)
            make.top.equalTo(loginTextField.snp.bottom).offset(
                LayoutConstants.ConfigureProfileView.ValidationErrorsLabel.topOffset
            )
            make.width.equalTo(loginTextField)
        }

        signUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(LayoutConstants.buttonsHeight)
            make.bottom.equalToSuperview().inset(
                LayoutConstants.ConfigureProfileView.SignUpButton.bottomOffset
            )
        }

        activityIndicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(signUpButton.snp.top).offset(-20)
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

extension ConfigureProfileViewController {
    private func setupBindings() {
        viewModel.isSuccessfulSignUp.bind { [weak self] (isSuccessfulSignUp) in
            guard let self else { return }
            if isSuccessfulSignUp {
                self.complitionHandler?()
            } else {
                self.showErrorAlert()
            }
        }

        viewModel.loginValidationError.bind { [weak self] (loginValidationError) in
            guard let self else { return }
            self.validationErrorsLabel.text = loginValidationError
        }

        viewModel.isLoadingData.bind { [weak self] (isLoadingData) in
            guard let self else { return }
            self.deactivateUI(isLoadingData)
        }
    }

    private func showErrorAlert() {
        let alert = alertFactory.createErrorAlert(message: Strings.Alerts.Messages.signUpErrorAlert)
        present(alert, animated: true)
    }

    private func deactivateUI(_ deactivate: Bool) {
        navigationController?.navigationBar.isHidden = !deactivate
        signUpButton.isEnabled = !deactivate
        activityIndicator.isHidden = !deactivate

        if deactivate {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
}

extension ConfigureProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

}
