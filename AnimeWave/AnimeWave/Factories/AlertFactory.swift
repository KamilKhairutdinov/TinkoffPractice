//
//  AlertFactory.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 19.03.2024.
//

import UIKit

class AlertFactory {

    func createErrorAlert(message: String) -> UIAlertController {
        let alert = UIAlertController(title: "error_alert_title".localized, message: message.localized, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "alert_action_try_again".localized, style: .cancel))

        return alert
    }
}
