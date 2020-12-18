//
//  Stats.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 16/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import Foundation

struct Stats : Codable {
    let baseStat : Int?
    let effort : Int?
    let stat : APIResult?

    enum CodingKeys: String, CodingKey {
        case effort, stat
        case baseStat = "base_stat"
    }

}
