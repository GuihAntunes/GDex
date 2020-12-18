//
//  PokedexEndpoint.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 16/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import Foundation

enum PokedexEndpoint: Endpoint {

    case list(Filters)
    case apiResource(String)

    var path: String {
        switch self {
        case .list:
            return baseURL + version + "/pokemon"
        case .apiResource(let urlString):
            return urlString
        }
    }

    var version: String {
        switch self {
        default:
            return "v2"
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return nil
        }
    }
    
    var body: Data? {
        switch self {
        default:
            return nil
        }
    }
    
    var httpMethod: String {
        switch self {
        default:
            return "GET"
        }
    }
    
    var request: URLRequest {
        switch self {
        default:
            guard var components = URLComponents(string: path) else { fatalError() }
            components.queryItems = queryItems
            guard let url = components.url else { fatalError() }
            var request = URLRequest(url: url)
            request.allHTTPHeaderFields = headers
            request.httpMethod = httpMethod
            request.httpBody = body
            return request
        }
    }
    
    var queryItems: [URLQueryItem]? {
        var items: [URLQueryItem] = .init()
        items.append(URLQueryItem(name: MainFilters.limit.rawValue, value: String(50)))
        switch self {
        case .list(let filters):
            items.append(contentsOf: filters.buildQueryItems())
        default:
            return nil
        }
        
        return items
    }
    
}
