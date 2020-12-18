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
    weak var viewModel: PokedexListViewModelProtocol?
    
    // MARK: - Initializers
    init(withTableView tableView: UITableView, andViewModel viewModel: PokedexListViewModelProtocol?) {
        self.pokemonsTableView = tableView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.pokemonsTableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
        self.viewModel = nil
        super.init(coder: coder)
    }
    
    // MARK: - View's Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        loadContent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    // MARK: - Setup Methods
    func loadContent() {
        addBlurLoading()
        viewModel?.loadContent()
    }
    
    func setupController() {
        setupTableView()
        setupConstraints()
    }
    
    private func setupTableView() {
        pokemonsTableView.register(UINib(nibName: PokedexTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: PokedexTableViewCell.reuseIdentifier)
        pokemonsTableView.dataSource = self
        pokemonsTableView.delegate = self
        pokemonsTableView.translatesAutoresizingMaskIntoConstraints = false
        pokemonsTableView.separatorStyle = .none
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
