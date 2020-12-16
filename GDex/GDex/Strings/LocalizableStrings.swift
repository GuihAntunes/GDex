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
    case ConfirmButtonTitle = "confirmButton_title"
    case BackButtonTitle = "backButton_title"
    
    // MARK: - Error Messages
    case GenericErrorMessage = "genericError_message"
    case ReleasedClassErrorMessage = "releasedClassError_message"
    case ConnectionErrorMessage = "connectionError_message"
    case MappingErrorMessage = "mappingError_message"
    
    func localize() -> String {
        return self.rawValue.localize()
    }
}
