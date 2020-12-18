//
//  Requester.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 16/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import Foundation

typealias RequesterCompletion<C:Codable> = (C?, NetworkError?) -> Void

final class Requester: RequesterProtocol {
    
    let connectionChecker: Reachability
    let decoder: JSONDecoder
    let session: URLSession
    
    init(connectionChecker: Reachability = .init(), decoder: JSONDecoder = .init(), session: URLSession = URLSession.shared) {
        self.decoder = decoder
        self.session = session
        self.connectionChecker = connectionChecker
    }
    
    func request<T: Codable>(model: T.Type, _ request: URLRequest, completion: @escaping RequesterCompletion<T>) {
            
            session.dataTask(with: request, completionHandler: { [weak self] (data, response, error) in
                
                guard let _self = self else {
                    completion(nil, NetworkError.deallocatedClassError(error: LocalizableStrings.releasedClassErrorMessage.localize()))
                    return
                }
                
                guard _self.connectionChecker.isConnected else {
                    completion(nil, NetworkError.connectionError(error: LocalizableStrings.connectionErrorMessage.localize()))
                    return
                }
                
                guard let data = data else {
                    completion(nil, NetworkError.sessionError(error: error?.localizedDescription ?? LocalizableStrings.genericErrorMessage.localize()))
                    return
                }
                
                guard error == nil else {
                    completion(nil, NetworkError.sessionError(error: error?.localizedDescription ?? LocalizableStrings.genericErrorMessage.localize()))
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    completion(nil, NetworkError.sessionError(error: error?.localizedDescription ?? LocalizableStrings.genericErrorMessage.localize()))
                    return
                }
                
                guard let model = try? _self.decoder.decode(T.self, from: data) else {
                    completion(nil, NetworkError.mappingError(error: String(format: LocalizableStrings.mappingErrorMessage.localize(), "\(T.self)")))
                    return
                }
                
                completion(model, nil)
            }).resume()
    }
}

