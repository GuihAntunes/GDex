//
//  PokedexListViewController.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 16/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import UIKit

class PokedexListViewController: UIViewController {

    // MARK: - Properties
    var pokemonsTableView: UITableView
    
    // MARK: - Initializers
    init(withTableView tableView: UITableView) {
        self.pokemonsTableView = tableView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.pokemonsTableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
        super.init(coder: coder)
    }
    
    // MARK: - View's Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    // MARK: - Setup Methods
    func setupController() {
        setupCollectionView()
        setupConstraints()
        addBlurLoading()
    }
    
    private func setupCollectionView() {
        pokemonsTableView.dataSource = self
        pokemonsTableView.delegate = self
        pokemonsTableView.backgroundColor = UIColor(named: UIColor.AppColors.appBackgroundColor.rawValue)
        pokemonsTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pokemonsTableView)
        view.bringSubviewToFront(pokemonsTableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            pokemonsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            pokemonsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            pokemonsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pokemonsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        view.layoutIfNeeded()
    }
    
    private func setupNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
