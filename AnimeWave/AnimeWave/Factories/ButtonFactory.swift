//
//  ButtonFactory.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 17.03.2024.
//

import UIKit

class ButtonFactory {
    func createButton(title: String, action: UIAction) -> UIButton {
        let button                = UIButton(configuration: .bordered())
        button.tintColor          = .clear
        button.layer.cornerRadius = 12
        button.backgroundColor    = UIColor.buttonAndTextField

        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.mainText, for: .normal)
        button.setTitleColor(UIColor.buttonTappedTitle, for: .highlighted)
        button.addAction(action, for: .touchUpInside)

        return button
    }

    func createPlainButton(title: String, action: UIAction) -> UIButton {
        let button       = UIButton(configuration: .plain())
        button.tintColor = .clear

        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.mainText, for: .normal)
        button.setTitleColor(UIColor.buttonTappedTitle, for: .highlighted)
        button.addAction(action, for: .touchUpInside)

        return button
    }
}
