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
    lazy var customNavigationBar = CustomNavigationBar(frame: CGRect(origin: .zero, size: CGSize(width: view.frame.size.width, height: 44)))
    
    // MARK: - Initializers
    init(withTableView tableView: UITableView, andViewModel viewModel: PokedexListViewModelProtocol?) {
        self.pokemonsTableView = tableView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = UIColor(named: UIColor.AppColors.navigationBarColor.rawValue)
    }
    
    required init?(coder: NSCoder) {
        self.pokemonsTableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
        self.viewModel = nil
        super.init(coder: coder)
        view.backgroundColor = UIColor(named: UIColor.AppColors.navigationBarColor.rawValue)
    }
    
    // MARK: - View's Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        loadContent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Setup Methods
    func loadContent() {
        addBlurLoading()
        viewModel?.loadContent()
    }
    
    func setupController() {
        setupTableView()
        setupNavigationBar()
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
            customNavigationBar.topAnchor.constraint(equalToSystemSpacingBelow: view.layoutMarginsGuide.topAnchor, multiplier: 0),
            customNavigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customNavigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customNavigationBar.heightAnchor.constraint(equalToConstant: 44),
            pokemonsTableView.topAnchor.constraint(equalTo: customNavigationBar.bottomAnchor),
            pokemonsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            pokemonsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pokemonsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        view.layoutIfNeeded()
    }
    
    private func setupNavigationBar() {
        customNavigationBar.translatesAutoresizingMaskIntoConstraints = false
        customNavigationBar.showBackButton(false)
        customNavigationBar.backgroundColor = .clear
        view.addSubview(customNavigationBar)
        customNavigationBar.setTitle(LocalizableStrings.pokedexListTitle.localize())
    }

}
