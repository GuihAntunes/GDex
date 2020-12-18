//
//  PokemonDetailHeaderView.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 18/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import MapleBacon
import UIKit

class PokemonDetailHeaderView: UIView {

    // MARK: - Outlets
    @IBOutlet weak private var largeImageView: UIImageView?
    @IBOutlet weak private var mainImageView: UIImageView?
    
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: - Setup Methods
    func setupHeaderView(withURLString string: String) {
        largeImageView?.setImage(with: URL(string: string))
        mainImageView?.setImage(with: URL(string: string))
    }
    
    private func setupView() {
        let view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "PokemonDetailHeaderView", bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView else {
            return .init()
        }
        
        return view
    }

}
