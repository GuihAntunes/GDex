//
//  Endpoint+Constants.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 16/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import Foundation

extension Endpoint {
    
    private var infoList: [String: Any] {
        guard let infoList = Bundle.main.infoDictionary else {
            return .init()
        }
        
        return infoList
    }
    
    var baseURL: String {
        
        guard let url = infoList["BASE_URL"] as? String else {
            return .init()
        }
        
        return url
    }
    
}
