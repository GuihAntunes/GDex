//
//  PokedexListViewController+TableView.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 16/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import UIKit

extension PokedexListViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UITableViewDataSource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.pokemons.count ?? .init()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PokedexTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        
        if let pokemon = viewModel?.getPokemon(forIndex: indexPath.row) {
            cell.setupCell(withName: pokemon.name, andPokemonImageURLString: pokemon.imageURLString)
        }
        
        loadMoreContentIfNeeded(indexPath.row)
        
        return cell
    }
    
    // MARK: - UITableViewDelegate Methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.pokemonSelected(atIndex: indexPath.row)
    }
    
    // MARK: - Support Methods
    
    func loadMoreContentIfNeeded(_ currentPokemonIndex: Int) {
        guard let pokemonsCount = viewModel?.pokemons.count else { return }
        let shouldLoadMoreContent = currentPokemonIndex >= pokemonsCount - 1
        if shouldLoadMoreContent {
            loadContent()
        }
    }

}
