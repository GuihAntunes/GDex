//
//  LocalizableStrings.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 16/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import Foundation

enum LocalizableStrings: String {
    
    // MARK: - View Elements Strings
    case confirmButtonTitle = "confirmButton_title"
    case backButtonTitle = "backButton_title"
    case pokedexListTitle = "pokedexList_title"
    
    // MARK: - Error Messages
    case genericErrorTitle = "genericError_title"
    case genericErrorMessage = "genericError_message"
    case releasedClassErrorMessage = "releasedClassError_message"
    case connectionErrorMessage = "connectionError_message"
    case mappingErrorMessage = "mappingError_message"
    
    func localize() -> String {
        return self.rawValue.localize()
    }
}
