//
//  AppCoordinator.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 16/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import UIKit

protocol AppCoordinatorProtocol: class {
    func presentNextStep<T: Codable>(withModel model: T?)
    func presentPreviousStep()
}

enum RoutingState {
    case list
    case detail
}

class AppCoordinator: AppCoordinatorProtocol {
    
    lazy var injector = AppCoordinatorDependencyInjector()
    var window: UIWindow
    var state: RoutingState
    
    init(window: UIWindow, andState state: RoutingState = .list) {
        self.window = window
        self.state = state
    }
    
    func start() {
        window.rootViewController = injector.navigationController
        window.makeKeyAndVisible()
    }
    
    func presentNextStep<T: Codable>(withModel model: T? = nil) {
        switch state {
        case .list:
            state = .detail
            injector.pokemonDetailsViewModel.pokemon = model as? Pokemon
            injector.navigationController.pushViewController(injector.pokemonDetailsController, animated: true)
            break
        case.detail:
            print("Last controller for this coordination flow!")
        }
    }
    
    func presentPreviousStep() {
        switch state {
        case .list:
            print("Root controller for this coordination flow!")
        case.detail:
            state = .list
            injector.navigationController.popViewController(animated: true)
        }
    }
    
}

