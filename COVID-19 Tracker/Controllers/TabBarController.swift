//
//  TabBarController.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2020/12/14.
//

import UIKit

class TabBarController: UITabBarController {
    
    //MARK: - Properties
    
    // Create Tab one
    let tabOne = UINavigationController(rootViewController: WorldVC())
    let tabOneBarItem = UITabBarItem(title: "World", image: UIImage(systemName: "globe", withConfiguration: UIImage.SymbolConfiguration(weight: .light)), selectedImage: UIImage(systemName: "globe", withConfiguration: UIImage.SymbolConfiguration(weight: .heavy)))
    
    // Create Tab two
    let tabTwo = UINavigationController(rootViewController: MyCountryVC())
    let tabTwoBarItem = UITabBarItem(title: "Country", image: UIImage(systemName: "chart.bar.fill", withConfiguration: UIImage.SymbolConfiguration(weight: .light)), selectedImage: UIImage(systemName: "chart.bar.fill", withConfiguration: UIImage.SymbolConfiguration(weight: .heavy)))
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabOne.tabBarItem = tabOneBarItem
        tabTwo.tabBarItem = tabTwoBarItem
        
        setViewControllers([tabOne, tabTwo], animated: true)
    }
}
