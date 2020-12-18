//
//  PokemonDetailsViewModel.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 18/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import Foundation

typealias PokemonDetail = (detailTitle: String, detailImageURLString: String?, detailDescription: String?)

protocol PokemonDetailsViewModelProtocol: class {
    var pokemon: Pokemon? { get }
    var pokemonDetails: [PokemonDetail] { get }
    func getPokemonDetail(forIndex index: Int) -> PokemonDetail
    func didDismissScreen()
}

class PokemonDetailsViewModel: PokemonDetailsViewModelProtocol {
    
    // MARK: - Properties
    var pokemonDetails: [PokemonDetail] = .init()
    var coordinator: AppCoordinatorProtocol
    var repository: PokedexRepositoryProtocol
    var pokemon: Pokemon? {
        didSet {
            generatePokemonDetails()
        }
    }
    
    // MARK: - Initializers
    init(withRepository repository: PokedexRepositoryProtocol, andCoordinator coordinator: AppCoordinatorProtocol) {
        self.repository = repository
        self.coordinator = coordinator
    }
    
    // MARK: - PokemonDetailsViewModelProtocol Methods
    func getPokemonDetail(forIndex index: Int) -> PokemonDetail {
        return pokemonDetails[index]
    }
    
    func didDismissScreen() {
        coordinator.presentPreviousStep()
    }
    
    // MARK: - Private Methods
    func generatePokemonDetails() {
        let nameDetail: PokemonDetail = (detailTitle: .init(), detailImageURLString: nil, detailDescription: pokemon?.name)
        pokemonDetails.append(nameDetail)
        
        let speciesDetail: PokemonDetail = (detailTitle: .init(), detailImageURLString: nil, detailDescription: pokemon?.species?.name)
        pokemonDetails.append(speciesDetail)
        
        let experienceDetail: PokemonDetail = (detailTitle: .init(), detailImageURLString: nil, detailDescription: pokemon?.baseExperience?.description)
        pokemonDetails.append(experienceDetail)
        
        let abilities = pokemon?.abilities?.filter({ $0.ability?.name != nil })
        let abilitiesDescription = abilities?.compactMap({ $0.ability?.name }).reduce("", { $0 == "" ? $1 : $0 + "," + $1 })
        let abilitiesDetail: PokemonDetail = (detailTitle: .init(), detailImageURLString: nil, detailDescription: abilitiesDescription)
        pokemonDetails.append(abilitiesDetail)
        
        if let shinyForm = pokemon?.sprites?.frontShiny {
            let shinyDetail: PokemonDetail = (detailTitle: .init(), detailImageURLString: shinyForm, detailDescription: nil)
            pokemonDetails.append(shinyDetail)
        }
        
        let types = pokemon?.types?.filter({ $0.type?.name != nil })
        let typesDescription = types?.compactMap({ $0.type?.name }).reduce("", { $0 == "" ? $1 : $0 + "," + $1 })
        let typesDetail: PokemonDetail = (detailTitle: .init(), detailImageURLString: nil, detailDescription: typesDescription)
        pokemonDetails.append(typesDetail)
        
        let moves = pokemon?.moves?.filter({ $0.move?.name != nil })
        let movesDescription = moves?.compactMap({ $0.move?.name }).reduce("", { $0 == "" ? $1 : $0 + "," + $1 })
        let movesDetail: PokemonDetail = (detailTitle: .init(), detailImageURLString: nil, detailDescription: movesDescription)
        pokemonDetails.append(movesDetail)
        
        
    }
}
