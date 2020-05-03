//
//  AppDelegate.swift
//  MercaChallenge
//
//  Created by Marcos Santos on 01/05/20.
//  Copyright © 2020 Marcos Santos. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
            .set(\.backgroundColor, to: .white)
            .set(\.tintColor, to: .black)

        if #available(iOS 13, *) {
            window?.backgroundColor = .systemBackground
            window?.tintColor = .label
        }

        window?.rootViewController = UINavigationController(rootViewController: ProductsViewController())
        window?.makeKeyAndVisible()

        return true
    }

}
