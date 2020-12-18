//
//  PokedexService.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 16/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import Foundation

class PokedexService: PokedexRepositoryProtocol {
    
    let requester: RequesterProtocol
    let group: DispatchGroup
    
    init(withRequester requester: RequesterProtocol = Requester(), andGroup group: DispatchGroup = .init()) {
        self.requester = requester
        self.group = group
    }
    
    func fetchPokemonList(withFilters filters: Filters, completion: @escaping RequesterCompletion<[Pokemon]>) {
        self.requester.request(model: APIResponse.self, PokedexEndpoint.list(filters).request) { [weak self] (response, error) in
            if error != nil {
                completion(nil, error)
                return
            }
            
            var fetchedPokemons: [Pokemon] = .init()
            
            if let pokemons = response?.results?.compactMap({ $0.url }) {
                pokemons.forEach({
                    self?.group.enter()
                    self?.requester.request(model: Pokemon.self, PokedexEndpoint.apiResource($0).request, completion: { (response, error) in
                        guard error == nil, let fetchedPokemon = response else {
                            completion(fetchedPokemons, error)
                            return
                        }
                        
                        fetchedPokemons.append(fetchedPokemon)
                        self?.group.leave()
                    })
                })
                
                self?.group.notify(queue: .main) {
                    completion(fetchedPokemons, nil)
                }
            }
        }
    }
    
}
