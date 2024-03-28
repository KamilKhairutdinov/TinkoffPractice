//
//  LayoutConstant.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 22.03.2024.
//
// swiftlint:disable all

import UIKit

enum LayoutConstants {

    // MARK: - AuthViewController
    enum AuthView {
        enum LogoImageView {
            static let topOffsetMultiplier: CGFloat = 1.0 / 6.0
        }
        enum SignInButton {
            static let bottomOffset: CGFloat = 150
        }
        enum SignUpButton {
            static let topOffset: CGFloat = 25
        }
    }

    // MARK: - SignUpViewController
    enum SignUpView {
        enum StackView {
            static let horizontalInset: CGFloat = 50
        }

        enum ValidationErrorsLabel {
            static let topOffset: CGFloat = 10
        }

        enum NextButton {
            static let bottomOffset: CGFloat = 50
        }
    }

    // MARK: - ConfigureProfileViewController
    enum ConfigureProfileView {
        enum FillProfileLabel {
            static let topOffset: CGFloat = 90
        }

        enum UserAvatarImageView {
            static let topOffset: CGFloat = 40
            static let widthHeightMultiplier: CGFloat = 0.5
        }

        enum PickImageButton {
            static let topOffset: CGFloat = 10
        }

        enum LoginTextField {
            static let topOffset: CGFloat = 30
            static let horizontalInset: CGFloat = 50
        }

        enum SignUpButton {
            static let bottomOffset: CGFloat = 50
        }

        enum ValidationErrorsLabel {
            static let topOffset: CGFloat = 10
        }

        enum ActivityIndicator {
            static let bottonOffset = -20
        }
    }

    // MARK: - SignInViewController
    enum SignInView {
        enum StackView {
            static let horizontalInset: CGFloat = 50
        }

        enum ValidationErrorsLabel {
            static let topOffset: CGFloat = 10
        }

        enum SignInButton {
            static let bottomOffset: CGFloat = 50
        }

        enum ActivityIndicator {
            static let bottonOffset = -20
        }
    }

    // MARK: - Global
    static let buttonsHeight: CGFloat = 40
    static let textFieldsHeight: CGFloat = 40
}
// swiftlint:enable all
