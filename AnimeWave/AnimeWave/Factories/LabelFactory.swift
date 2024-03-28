//
//  LabelFactory.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 28.03.2024.
//

import UIKit

class LabelFactory {

    func createLabel() -> UILabel {
        let label = UILabel()
        label.textColor = UIColor.mainText
        label.font = UIFont.boldSystemFont(ofSize: 20)

        return label
    }

    func createLabel(color: UIColor, font: UIFont) -> UILabel {
        let label = UILabel()
        label.textColor = color
        label.font = font

        return label
    }

    func createSecondaryLabel() -> UILabel {
        let label = UILabel()
        label.textColor = UIColor.secondaryText
        label.font = UIFont.systemFont(ofSize: 16)

        return label
    }
}
