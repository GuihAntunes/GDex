//
//  AppAppearance.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 16/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import UIKit

class AppAppearance {
    
    static func setAppAppearance() {
        setAppBackgroundColor()
        setAppNavigationBarAppearance()
    }
    
    static func setAppNavigationBarAppearance() {
        UINavigationBar.appearance().barTintColor = UIColor(named: UIColor.AppColors.navigationBarColor.rawValue)
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.AppColors.accentColor.rawValue,
            NSAttributedString.Key.font: UIFont(name: FontsNames.AvenirNextCondensed.rawValue, size: 20) ?? UIFont.systemFont(ofSize: 20)
        ]
        UINavigationBar.appearance().prefersLargeTitles = false
    }
    
    static func setAppBackgroundColor() {
        let subviewsBackgroundColor = UIColor(named: UIColor.AppColors.appBackgroundColor.rawValue)
        UITableView.appearance().backgroundColor = subviewsBackgroundColor
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
}
