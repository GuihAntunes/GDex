//
//  NetworkingProtocols.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 16/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import Foundation

protocol RequesterProtocol {
    func request<T: Codable>(model: T.Type, _ request: URLRequest, completion: @escaping RequesterCompletion<T>)
}

protocol Endpoint {
    var path: String { get }
    var headers: [String: String]? { get }
    var body: Data? { get }
    var httpMethod: String { get }
    var request: URLRequest { get }
    var queryItems: [URLQueryItem]? { get }
    var version: String { get }
}
