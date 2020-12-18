//
//  NetworkError.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 16/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case invalidRequest
    case noInternetConnection
    case noHTTPURLResponse
    case statusCodeError(statusCode: Int)
    case sessionError(error: String)
    case mappingError(error: String)
    case unknown(description: String)
    case connectionError(error: String)
    case generalError(error: String)
    case deallocatedClassError(error: String)
}
