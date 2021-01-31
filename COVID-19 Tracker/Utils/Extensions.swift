//
//  Extensions.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2020/12/15.
//

import UIKit

//MARK: - UIViewController

extension UIViewController {
    
    func setupNavigationBar(title: String) {
        navigationItem.title = title
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let appearance = UINavigationBarAppearance()
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.clear
        appearance.shadowColor = .clear
        navigationItem.standardAppearance = appearance
    }
    
}
