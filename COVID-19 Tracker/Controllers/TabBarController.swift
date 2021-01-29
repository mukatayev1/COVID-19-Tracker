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
    let tabOne = TimelineVC()
    let tabOneBarItem = UITabBarItem(title: "World", image: UIImage(systemName: "globe", withConfiguration: UIImage.SymbolConfiguration(weight: .light)), selectedImage: UIImage(systemName: "globe", withConfiguration: UIImage.SymbolConfiguration(weight: .heavy)))
    
    // Create Tab two
    let tabTwo = ChartVC()
    let tabTwoBarItem = UITabBarItem(title: "Country", image: UIImage(systemName: "chart.bar.fill", withConfiguration: UIImage.SymbolConfiguration(weight: .light)), selectedImage: UIImage(systemName: "chart.bar.fill", withConfiguration: UIImage.SymbolConfiguration(weight: .heavy)))
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        tabOne.tabBarItem = tabOneBarItem
        tabTwo.tabBarItem = tabTwoBarItem
        setupTabBar()
        
        setViewControllers([tabOne, tabTwo], animated: true)
    }
    
    //MARK: - Helpers
    
    func setupTabBar() {
        tabBar.barTintColor = CustomColors.darkBlue
        tabBar.tintColor = CustomColors.lightGray
    }

//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        print("Selected \(item.title!)")
//    }

}
