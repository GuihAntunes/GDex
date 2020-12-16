//
//  Pokemon.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 16/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
    let abilities : [Abilities]?
    let baseExperience : Int?
    let height : Int?
    let heldItems : [String]?
    let forms: [APIResult]?
    let identifier : Int?
    let locationAreaEncounters : String?
    let moves : [Moves]?
    let name : String?
    let species : APIResult?
    let stats : [Stats]?
    let types : [Types]?
    let weight : Int?

    enum CodingKeys: String, CodingKey {
        case abilities, moves, name, species, stats, types, weight, forms, height
        case identifier = "id"
        case baseExperience = "base_experience"
        case heldItems = "held_items"
        case locationAreaEncounters = "location_area_encounters"
    }
}
