//
//  PokedexTableViewCell.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 18/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import MapleBacon
import UIKit

class PokedexTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak private var pokemonImageView: UIImageView?
    @IBOutlet weak private var pokemonNameLabel: UILabel?
    
    // MARK: - Setup Methods
    func setupCell(withName name: String?, andPokemonImageURLString urlString: String?) {
        if let urlString = urlString {
            pokemonImageView?.setImage(with: URL(string: urlString))
        }
        
        pokemonNameLabel?.text = name
    }
    
    // MARK: - View's Life Cycle
    override func prepareForReuse() {
        super.prepareForReuse()
        pokemonImageView?.cancelDownload()
        pokemonNameLabel?.text = .init()
    }
}
