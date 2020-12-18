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
    var pokemonName: String { get }
    var pokemonDetails: [PokemonDetail] { get }
    func getPokemonDetail(forIndex index: Int) -> PokemonDetail
    func didDismissScreen()
}

class PokemonDetailsViewModel: PokemonDetailsViewModelProtocol {
    
    // MARK: - Properties
    var pokemonName: String = .init()
    var pokemonDetails: [PokemonDetail] = .init()
    var coordinator: AppCoordinatorProtocol
    var repository: PokedexRepositoryProtocol
    var pokemon: Pokemon? {
        didSet {
            pokemonName = pokemon?.name?.uppercaseFirstLetter() ?? .init()
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
        pokemonDetails.removeAll()
        let nameDetail: PokemonDetail = (detailTitle: LocalizableStrings.pokemonDetailsNameTitle.localize(), detailImageURLString: nil, detailDescription: pokemon?.name?.uppercaseFirstLetter())
        pokemonDetails.append(nameDetail)
        
        let speciesDetail: PokemonDetail = (detailTitle: LocalizableStrings.pokemonDetailsSpeciesTitle.localize(), detailImageURLString: nil, detailDescription: pokemon?.species?.name?.uppercaseFirstLetter())
        pokemonDetails.append(speciesDetail)
        
        let experienceDetail: PokemonDetail = (detailTitle: LocalizableStrings.pokemonDetailsExperienceTitle.localize(), detailImageURLString: nil, detailDescription: pokemon?.baseExperience?.description)
        pokemonDetails.append(experienceDetail)
        
        let abilities = pokemon?.abilities?.filter({ $0.ability?.name != nil })
        let abilitiesDescription = abilities?.compactMap({ $0.ability?.name?.uppercaseFirstLetter() }).reduce("", { $0 == "" ? $1 : $0 + ", " + $1 })
        let abilitiesDetail: PokemonDetail = (detailTitle: LocalizableStrings.pokemonDetailsAbilitiesTitle.localize(), detailImageURLString: nil, detailDescription: abilitiesDescription)
        pokemonDetails.append(abilitiesDetail)
        
        if let shinyForm = pokemon?.sprites?.frontShiny {
            let shinyDetail: PokemonDetail = (detailTitle: LocalizableStrings.pokemonDetailsShinyTitle.localize(), detailImageURLString: shinyForm, detailDescription: nil)
            pokemonDetails.append(shinyDetail)
        }
        
        let types = pokemon?.types?.filter({ $0.type?.name != nil })
        let typesDescription = types?.compactMap({ $0.type?.name?.uppercaseFirstLetter() }).reduce("", { $0 == "" ? $1 : $0 + ", " + $1 })
        let typesDetail: PokemonDetail = (detailTitle: LocalizableStrings.pokemonDetailsTypesTitle.localize(), detailImageURLString: nil, detailDescription: typesDescription)
        pokemonDetails.append(typesDetail)
        
        let moves = pokemon?.moves?.filter({ $0.move?.name != nil })
        let movesDescription = moves?.compactMap({ $0.move?.name?.uppercaseFirstLetter() }).reduce("", { $0 == "" ? $1 : $0 + ", " + $1 })
        let movesDetail: PokemonDetail = (detailTitle: LocalizableStrings.pokemonDetailsMovesTitle.localize(), detailImageURLString: nil, detailDescription: movesDescription)
        pokemonDetails.append(movesDetail)
    }
}
