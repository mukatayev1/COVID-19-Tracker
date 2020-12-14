//
//  TabBarController.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2020/12/14.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create Tab one
        let tabOne = TimelineVC()
        let tabOneBarItem = UITabBarItem(title: "World", image: UIImage(systemName: "globe", withConfiguration: UIImage.SymbolConfiguration(weight: .medium)), selectedImage: nil)
        
        tabOne.tabBarItem = tabOneBarItem
        
        
        // Create Tab two
        let tabTwo = MyCountryVC()
        let tabTwoBarItem2 = UITabBarItem(title: "My Country", image: UIImage(systemName: "mappin.circle.fill", withConfiguration: UIImage.SymbolConfiguration(weight: .medium)), selectedImage: nil)
        
        tabTwo.tabBarItem = tabTwoBarItem2
        
        let tabThree = ChartVC()
        let tabTwoBarItem3 = UITabBarItem(title: "Chart", image: UIImage(systemName: "chart.bar.fill", withConfiguration: UIImage.SymbolConfiguration(weight: .medium)), selectedImage: nil)
        
        tabThree.tabBarItem = tabTwoBarItem3
        
        
       setViewControllers([tabOne, tabTwo, tabThree], animated: true)
    }
    
    // UITabBarControllerDelegate method
    func tabBarController(_ tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        print("Selected \(viewController.title!)")
    }
    
}
