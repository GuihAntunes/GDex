//
//  CustomNavigationBar.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 18/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import UIKit

protocol CustomNavigationBarDelegate: class {
    func didPressBackButton()
}

class CustomNavigationBar: UIView {
    
    // MARK: - Outlets
    @IBOutlet weak private var backButton: UIButton?
    @IBOutlet weak private var titleLabel: UILabel?
    
    // MARK: - Properties
    weak var delegate: CustomNavigationBarDelegate?
    
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
    
    private func setupView() {
        let view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CustomNavigationBar", bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView else {
            return .init()
        }
        
        return view
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        delegate?.didPressBackButton()
    }
    
    // MARK: - Public Methods
    func setTitle(_ title: String) {
        titleLabel?.text = title
    }
    
}
