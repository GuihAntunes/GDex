//
//  PokedexListViewController+TableView.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 16/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import UIKit

extension PokedexListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.pokemons.count ?? .init()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PokedexTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        if let pokemon = viewModel?.getPokemon(forIndex: indexPath.row) {
            cell.setupCell(withName: pokemon.name, andPokemonImageURLString: pokemon.imageURLString)
        }
        return cell
    }

}
