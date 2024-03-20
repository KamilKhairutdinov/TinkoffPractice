//
//  UIViewController + extension.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 18.03.2024.
//

import UIKit

extension UIViewController {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { view.addSubview($0) }
    }
}
