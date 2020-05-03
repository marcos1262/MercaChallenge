//
//  UIViewController+Helpers.swift
//  MercaChallenge
//
//  Created by Marcos Santos
//  Copyright © 2020 Marcos Santos. All rights reserved.
//

import UIKit

extension UIViewController {
    func showError(message: String?, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
        present(alert, animated: true, completion: completion)
    }
}
