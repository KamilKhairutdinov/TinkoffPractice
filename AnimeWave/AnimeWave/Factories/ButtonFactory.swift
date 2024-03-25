//
//  ButtonFactory.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 17.03.2024.
//

import UIKit

class ButtonFactory {

    func createButton(title: String, action: UIAction) -> UIButton {
        let button = UIButton(configuration: .bordered(), primaryAction: action)
        button.tintColor = UIColor.buttonAndTextField
        button.backgroundColor = .clear
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.mainText, for: .normal)
        button.setTitleColor(UIColor.buttonTappedTitle, for: .highlighted)

        return button
    }

    func createPlainButton(title: String, action: UIAction) -> UIButton {
        let button = UIButton(configuration: .plain(), primaryAction: action)
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.mainText, for: .normal)
        button.setTitleColor(UIColor.buttonTappedTitle, for: .highlighted)

        return button
    }
}
