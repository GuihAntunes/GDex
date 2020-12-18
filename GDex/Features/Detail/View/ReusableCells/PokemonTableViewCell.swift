//
//  PokemonTableViewCell.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 18/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import MapleBacon
import UIKit

class PokemonTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak private var pokemonDetailLabel: UILabel?
    @IBOutlet weak private var pokemonDetailImageView: UIImageView?
    @IBOutlet weak private var pokemonDetailDescriptionLabel: UILabel?
    
    // MARK: - Setup Methods
    func setupCell(withDetailTitle title: String, imageURLString: String?, andDetailDescription detailDescription: String?) {
        pokemonDetailDescriptionLabel?.isHidden = detailDescription != nil
        pokemonDetailImageView?.isHidden = imageURLString != nil
        
        if let string = imageURLString {
            pokemonDetailImageView?.setImage(with: URL(string: string))
        }
        
        pokemonDetailLabel?.text = title
        pokemonDetailDescriptionLabel?.text = detailDescription
    }
    
    // MARK: - View's Life Cycle
    override func prepareForReuse() {
        super.prepareForReuse()
        pokemonDetailImageView?.cancelDownload()
        pokemonDetailLabel?.text = .init()
        pokemonDetailDescriptionLabel?.text = .init()
    }
}
