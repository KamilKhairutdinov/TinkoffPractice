//
//  TextFieldFactory.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 17.03.2024.
//

import UIKit

class TextFieldFactory {

    func createTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.layer.cornerRadius = 8
        textField.borderStyle = .none
        textField.backgroundColor = UIColor.buttonAndTextField
        textField.textColor = UIColor.textFieldText
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.placeholder])

        return textField
    }
}
