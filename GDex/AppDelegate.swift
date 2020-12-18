//
//  AppDelegate.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 16/12/2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return didSetupApp()
    }

    private func didSetupApp() -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        guard let window = window else {
            print("window is unexpectedly nil")
            return false
        }
        
        coordinator = AppCoordinator(window: window)
        coordinator?.start()
        AppAppearance.setAppAppearance()
        return true
    }

}

