//
//  Types.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 16/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import Foundation

struct Types: Codable {
    let slot : Int?
    let type : APIResult?

    enum CodingKeys: String, CodingKey {
        case slot, type
    }
}
