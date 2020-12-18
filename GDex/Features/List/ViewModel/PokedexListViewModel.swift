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
    func getPokemon(forIndex index: Int) -> (name: String?, imageURLString: String?)
    func loadContent()
    func pokemonSelected(atIndex index: Int)
}

class PokedexListViewModel: PokedexListViewModelProtocol {
    
    // MARK: - Properties
    var pokemons: [Pokemon] = .init()
    var coordinator: AppCoordinatorProtocol
    var repository: PokedexRepositoryProtocol
    weak var view: PokedexListPresentable?
    
    // MARK: - Initializers
    init(withRepository repository: PokedexRepositoryProtocol, andCoordinator coordinator: AppCoordinatorProtocol) {
        self.repository = repository
        self.coordinator = coordinator
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
            
            self?.handleResponse(fetchedPokemons)
        }
    }
    
    func getPokemon(forIndex index: Int) -> (name: String?, imageURLString: String?) {
        let pokemon = pokemons[index]
        return (name: pokemon.name?.uppercaseFirstLetter(), imageURLString: pokemon.sprites?.frontDefault)
    }
    
    func pokemonSelected(atIndex index: Int) {
        let selectedPokemon = pokemons[index]
        coordinator.presentNextStep(withModel: selectedPokemon)
    }
    
    // MARK: - Private Methods
    func handleResponse(_ fetchedPokemons: [Pokemon]) {
        pokemons.append(contentsOf: fetchedPokemons)
        pokemons.sort(by: { $0.identifier < $1.identifier })
        view?.reloadList()
    }
    
}
