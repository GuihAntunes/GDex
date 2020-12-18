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
        setLabelsAppeareance()
    }
    
    static func setAppBackgroundColor() {
        let subviewsBackgroundColor = UIColor(named: UIColor.AppColors.appBackgroundColor.rawValue)
        UITableView.appearance().backgroundColor = subviewsBackgroundColor
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    static func setLabelsAppeareance() {
        UILabel.appearance().textColor = UIColor(named: UIColor.AppColors.textColor.rawValue)
        UILabel.appearance().font = UIFont(name: FontsNames.AvenirNextCondensed.rawValue, size: 20) ?? UIFont.systemFont(ofSize: 20)
    }
    
}
