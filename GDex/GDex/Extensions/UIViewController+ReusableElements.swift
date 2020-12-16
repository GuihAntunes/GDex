//
//  UIViewController+ReusableElements.swift
//  GDex
//
//  Created by Guilherme Antunes Ferreira on 16/12/2020.
//  Copyright © 2020 Guihsoft. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // MARK: - Alert
    func alert(title: String = .init(), message: String, completion: (() -> Void)? = nil, okActionHandler: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: LocalizableStrings.ConfirmButtonTitle.localize(), style: .default, handler: okActionHandler)
        alertController.addAction(OKAction)
        present(alertController, animated: true, completion: completion)
    }
    
    // MARK: - Back Button override
    func setBackButton(_ backFunction: Selector) {
        navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(image: UIImage(named: ImagesNames.BackButtonImage.rawValue), style: .plain, target: self, action: backFunction)
        navigationItem.title = LocalizableStrings.BackButtonTitle.localize()
        navigationItem.leftBarButtonItem = newBackButton
        if #available(iOS 14.0, *) {
            navigationItem.backButtonDisplayMode = .minimal
        }
    }
    
    // MARK: - Loading Indicator
    func addBlurLoading() {
        let showActivity = UIActivityIndicatorView()
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
        showActivity.center = view.center
        showActivity.color = UIColor.white
        blurEffectView.contentView.addSubview(showActivity)
        blurEffectView.contentView.bringSubviewToFront(showActivity)
        showActivity.startAnimating()
    }
    
    func removeBlurLoading() {
        view.subviews.forEach({ (view) in
            if view is UIVisualEffectView {
                view.removeFromSuperview()
            }
        })
    }
    
}
