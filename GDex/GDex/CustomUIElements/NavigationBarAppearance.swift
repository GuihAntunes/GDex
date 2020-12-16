//
//  NavigationBarAppearance.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 16/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import UIKit

class NavigationBarAppearance {
    
    static func setAppNavigationBarAppearance() {
        UINavigationBar.appearance().barTintColor = UIColor(named: UIColor.AppColors.navigationBarColor.rawValue)
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont(name: FontsNames.AvenirNextCondensed.rawValue, size: 20) ?? UIFont.systemFont(ofSize: 20)
        ]
        UINavigationBar.appearance().prefersLargeTitles = false
    }
    
}
