//
//  AppCoordinatorDependencyInjector.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 16/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import UIKit

class AppCoordinatorDependencyInjector {
    
    // MARK: - Coordinator
    lazy var appCoordinator: AppCoordinator = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate, let coordinator = appDelegate.coordinator else { return AppCoordinator(window: UIWindow(frame: UIScreen.main.bounds)) }
        return coordinator
    }()
    
    // MARK: - Main Navigation
    lazy var navigationController: UINavigationController = {
        let navigation: UINavigationController = .init()
        navigation.setNavigationBarHidden(true, animated: false)
        navigation.viewControllers.append(pokedexListController)
        return navigation
    }()
    
    // MARK: - View Controllers
    lazy var pokedexListController: PokedexListViewController = {
        let tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
        let viewModel = pokedexViewModel
        let controller: PokedexListViewController = .init(withTableView: tableView, andViewModel: viewModel)
        viewModel.view = controller
        return controller
    }()
    
    lazy var pokemonDetailsController: PokemonDetailsViewController = {
        let tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
        let viewModel = pokemonDetailsViewModel
        let controller: PokemonDetailsViewController = .init(withTableView: tableView, andViewModel: viewModel)
        return controller
    }()
    
    // MARK: - View Models
    lazy var pokedexViewModel: PokedexListViewModel = {
        return .init(withRepository: pokedexRepository, andCoordinator: appCoordinator)
    }()
    
    lazy var pokemonDetailsViewModel: PokemonDetailsViewModel = {
        return .init(withRepository: pokedexRepository, andCoordinator: appCoordinator)
    }()
    
    // MARK: - Repositories
    lazy var pokedexRepository: PokedexRepository = {
        return .init()
    }()
    
}
