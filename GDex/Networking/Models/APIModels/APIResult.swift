//
//  APIResult.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 16/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import Foundation

struct APIResult : Codable {
    let name : String?
    let url : String?

    enum CodingKeys: String, CodingKey {
        case name, url
    }
}
