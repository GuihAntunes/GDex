//
//  PokedexRepository.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 16/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import Foundation

protocol PokedexRepositoryProtocol: class {
    func fetchPokemonList(withFilters filters: Filters, completion: @escaping RequesterCompletion<[Pokemon]>)
}

class PokedexRepository: PokedexRepositoryProtocol {
    
    let pokedexService: PokedexService
    
    init(withService service: PokedexService = .init()) {
        self.pokedexService = service
    }
    
    func fetchPokemonList(withFilters filters: Filters, completion: @escaping RequesterCompletion<[Pokemon]>) {
        DispatchQueue.global().async { [weak self] in
            self?.fetchPokemonList(withFilters: filters, completion: completion)
        }
    }
    
}
