//
//  PokemonDetailsViewController.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 18/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import UIKit

class PokemonDetailsViewController: ViewController, CustomNavigationBarDelegate {
    
    // MARK: - Properties
    weak var viewModel: PokemonDetailsViewModelProtocol?
    var pokemonTableView: UITableView
    lazy var customNavigationBar = CustomNavigationBar(frame: CGRect(origin: .zero, size: CGSize(width: view.frame.size.width, height: 44)))
    
    // MARK: - Initializers
    init(withTableView tableView: UITableView, andViewModel viewModel: PokemonDetailsViewModelProtocol?) {
        self.pokemonTableView = tableView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.pokemonTableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
        self.viewModel = nil
        super.init(coder: coder)
    }
    
    // MARK: - View's Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareUI()
    }
    
    // MARK: - Setup Methods
    func prepareUI() {
        pokemonTableView.reloadData()
        customNavigationBar.setTitle(viewModel?.pokemonName ?? .init())
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setupController() {
        view.backgroundColor = UIColor(named: UIColor.AppColors.navigationBarColor.rawValue)
        setupTableView()
        setupNavigationBar()
        setupConstraints()
    }
    
    // MARK: - Setup Methods
    private func setupTableView() {
        pokemonTableView.dataSource = self
        pokemonTableView.delegate = self
        pokemonTableView.register(UINib(nibName: PokemonTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: PokemonTableViewCell.reuseIdentifier)
        pokemonTableView.translatesAutoresizingMaskIntoConstraints = false
        pokemonTableView.estimatedRowHeight = 80
        pokemonTableView.separatorStyle = .none
        view.addSubview(pokemonTableView)
    }
    
    func setupNavigationBar() {
        customNavigationBar.translatesAutoresizingMaskIntoConstraints = false
        customNavigationBar.delegate = self
        view.addSubview(customNavigationBar)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            customNavigationBar.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 0),
            customNavigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customNavigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customNavigationBar.heightAnchor.constraint(equalToConstant: 44),
            pokemonTableView.topAnchor.constraint(equalTo: customNavigationBar.bottomAnchor),
            pokemonTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            pokemonTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pokemonTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        view.layoutIfNeeded()
    }
    
    // MARK: CustomNavigationBarDelegate Methods
    func didPressBackButton() {
        viewModel?.didDismissScreen()
    }


}
