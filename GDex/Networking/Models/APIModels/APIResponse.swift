//
//  APIResponse.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 16/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import Foundation

struct APIResponse : Codable {
    let count : Int?
    let next : String?
    let previous : String?
    let results : [APIResult]?

    enum CodingKeys: String, CodingKey {
        case count, next, previous, results
    }

}
