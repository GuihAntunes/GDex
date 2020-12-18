//
//  PokedexListViewModel.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 18/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import Foundation

protocol PokedexListViewModelProtocol: class {
    var pokemons: [Pokemon] { get }
    func loadContent()
}

class PokedexListViewModel: PokedexListViewModelProtocol {
    
    // MARK: - Properties
    var pokemons: [Pokemon] = .init()
    var repository: PokedexRepositoryProtocol
    weak var view: PokedexListPresentable?
    
    init(withRepository repository: PokedexRepositoryProtocol) {
        self.repository = repository
    }
    
    // MARK: - PokedexListViewModelProtocol Methods
    func loadContent() {
        let filters = [
            MainFilters.offset.rawValue : String(pokemons.count)
        ]
        repository.fetchPokemonList(withFilters: filters) { [weak self] (response, error) in
            guard error == nil, let fetchedPokemons = response else {
                self?.view?.displayError(withTitle: LocalizableStrings.genericErrorTitle.localize(), andMessage: error?.localizedDescription ?? LocalizableStrings.genericErrorMessage.localize())
                return
            }
            
            self?.pokemons.append(contentsOf: fetchedPokemons)
            self?.view?.reloadList()
        }
    }
    
}
