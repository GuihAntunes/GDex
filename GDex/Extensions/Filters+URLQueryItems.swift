//
//  Filters+URLQueryItems.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 16/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import Foundation

typealias Filters = [String:String]

extension Filters {
    func buildQueryItems() -> [URLQueryItem] {
         return self.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
