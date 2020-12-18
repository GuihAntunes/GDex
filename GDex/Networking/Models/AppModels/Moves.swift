//
//  Moves.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 16/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import Foundation

struct Moves: Codable {
    let move : APIResult?

    enum CodingKeys: String, CodingKey {
        case move
    }
}
