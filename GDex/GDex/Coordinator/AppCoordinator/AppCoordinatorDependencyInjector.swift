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
        return navigation
    }()
    
    // MARK: - View Controllers
    
    // MARK: - View Models
    
    // MARK: - Repositories
    
}