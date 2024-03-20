//
//  String + extension.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 17.03.2024.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(
            self,
            comment: "\(self) could not be found in Localizable.strings")
    }
}
