//
//  ButtonFactory.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 17.03.2024.
//

import UIKit

class ButtonFactory {
    func createButton(title: String, action: UIAction) -> UIButton {
        let button = UIButton(configuration: .bordered())

        button.addAction(action, for: .touchUpInside)
        button.setTitle(title, for: .normal)
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor.buttonAndTextField
        button.setTitleColor(UIColor.mainText, for: .normal)
        button.setTitleColor(UIColor.buttonTappedTitle, for: .highlighted)

        return button
    }
}
