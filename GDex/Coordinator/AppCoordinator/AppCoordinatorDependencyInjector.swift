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
        let navigation = UINavigationController()
        navigation.viewControllers.append(pokedexListController)
        return navigation
    }()
    
    // MARK: - View Controllers
    lazy var pokedexListController: PokedexListViewController = {
        let viewModel = pokedexViewModel
        let controller: PokedexListViewController = .init(withTableView: UITableView(frame: UIScreen.main.bounds, style: .plain), andViewModel: viewModel)
        viewModel.view = controller
        return controller
    }()
    
    // MARK: - View Models
    lazy var pokedexViewModel: PokedexListViewModel = {
        return .init(withRepository: pokedexRepository, andCoordinator: appCoordinator)
    }()
    
    // MARK: - Repositories
    lazy var pokedexRepository: PokedexRepository = {
        return .init()
    }()
    
}
