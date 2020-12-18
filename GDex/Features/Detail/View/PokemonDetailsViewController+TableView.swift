//
//  PokemonDetailsViewController+TableView.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 18/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import UIKit

extension PokemonDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.pokemonDetails.count ?? .init()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PokemonTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        if let details = viewModel?.getPokemonDetail(forIndex: indexPath.row) {
            cell.setupCell(withDetailTitle: details.detailTitle, imageURLString: details.detailImageURLString, andDetailDescription: details.detailDescription)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
