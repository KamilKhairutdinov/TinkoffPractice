//
//  LayoutConstant.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 22.03.2024.
//

import UIKit

 enum LayoutConstants {

     // MARK: - AuthViewController
     enum AuthView {
         enum LogoImageView {
             static let topOffsetMultiplier: CGFloat = 1.0 / 3.0
         }
         enum SignInButton {
             static let bottomOffset: CGFloat = 70
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

     // MARK: - ConfigureUserViewController
     enum ConfigureUserView {
         enum FillProfileLabel {
             static let topOffset: CGFloat = 70
         }

         enum UserAvatarImageView {
             static let topOffset: CGFloat = 100
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
     }
 }
