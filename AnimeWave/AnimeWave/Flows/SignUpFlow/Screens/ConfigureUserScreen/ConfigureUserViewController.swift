//
//  ConfigureUserViewController.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 18.03.2024.
//

import UIKit
import SnapKit

final class ConfigureUserViewController: UIViewController {

    // MARK: - UI elements
    private lazy var fillProfileLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.mainText
        label.text = "fillProfileLabel_text".localized

        return label
    }()

    private lazy var userAvatarImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.defaultAvatar)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = view.frame.width / 4

        return imageView
    }()

    private lazy var selectImageButton: UIButton = {
        let action = UIAction { [weak self] _ in
            guard let self else { return }
            self.present(self.avatarImagePickerController, animated: true)
        }
        let button = buttonFactory.createPlainButton(title: "pick_image_button".localized, action: action)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private lazy var loginTextField: UITextField = {
        let textField = textFieldFactory.createTextField(placeholder: "login_placeholder".localized)
        textField.returnKeyType = .done
        textField.delegate = self

        return textField
    }()

    private lazy var signUpButton: UIButton = {
        let action = UIAction { [weak self] _ in
            guard let self else { return }
            self.complitionHandler?()
        }
        let button = buttonFactory.createButton(title: "sign_up_button".localized, action: action)

        return button
    }()

    // MARK: - Variables
    var complitionHandler: (() -> Void)?
    private var viewModel: ConfigureUserViewModel
    private var buttonFactory = ButtonFactory()
    private var textFieldFactory = TextFieldFactory()
    private lazy var avatarImagePickerController: UIImagePickerController = {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        return imagePickerController
    }()

    // MARK: - Init
    init(viewModel: ConfigureUserViewModel) {
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

extension ConfigureUserViewController: UITextFieldDelegate {
    private func setupView() {
        view.backgroundColor = UIColor.background
        addSubviews(
            fillProfileLabel,
            userAvatarImageView,
            selectImageButton,
            loginTextField,
            signUpButton
        )
        configureUI()
    }

    private func configureUI() {
        fillProfileLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.centerX.equalToSuperview()
        }

        userAvatarImageView.snp.makeConstraints { make in
            make.width.height.equalTo(view.frame.width / 2)
            make.top.equalTo(fillProfileLabel.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
        }

        selectImageButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(userAvatarImageView.snp.bottom).offset(10)
        }

        loginTextField.snp.makeConstraints { make in
            make.top.equalTo(selectImageButton.snp.bottom).offset(30)
            make.left.right.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()
        }

        signUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(loginTextField)
            make.bottom.equalToSuperview().inset(50)
        }

    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

extension ConfigureUserViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

}
