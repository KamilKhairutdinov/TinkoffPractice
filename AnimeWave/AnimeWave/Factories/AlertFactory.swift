//
//  AlertFactory.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 19.03.2024.
//

import UIKit

class AlertFactory {

    func createErrorAlert(message: String) -> UIAlertController {
        let alert = UIAlertController(title: Strings.Alerts.Titles.errorAlertTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Strings.Alerts.Action.alertActionTryAgain, style: .cancel))

        return alert
    }
}
