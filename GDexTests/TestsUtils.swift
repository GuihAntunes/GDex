//
//  TestsUtils.swift
//  GDexTests
//
//  Created by Guilherme Antunes Ferreira on 18/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import XCTest
@testable import GDex

class TestsUtils {
    
    func getMockedResponse(_ fileName: String) -> [Pokemon]? {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: fileName, withExtension: "json"), let data = try? Data(contentsOf: url) else {
            return nil
        }
        
        guard let model = try? JSONDecoder().decode([Pokemon].self, from: data) else {
            return nil
        }
        
        return model
    }
    
}
