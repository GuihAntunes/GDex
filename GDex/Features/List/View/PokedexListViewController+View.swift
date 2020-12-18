//
//  PokedexListViewController+View.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 18/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import UIKit

protocol PokedexListPresentable: class {
    func reloadList()
    func displayError(withTitle title: String, andMessage message: String)
}

extension PokedexListViewController: PokedexListPresentable {
    
    func reloadList() {
        removeBlurLoading()
        pokemonsTableView.reloadData()
    }
    
    func displayError(withTitle title: String, andMessage message: String) {
        alert(title: title, message: message, completion: nil, okActionHandler: nil)
    }
    
}
