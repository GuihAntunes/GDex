//
//  String+MutatingExtensions.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 18/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import Foundation

extension String {
    func uppercaseFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func uppercaseFirstLetter() {
        self = self.uppercaseFirstLetter()
    }
}
