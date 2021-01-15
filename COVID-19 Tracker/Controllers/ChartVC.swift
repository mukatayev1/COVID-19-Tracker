//
//  ChartVC.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2020/12/14.
//

import UIKit
import Alamofire

class ChartVC: UIViewController {
    
    //MARK: - Properties
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientLayer(from: CustomColors.darkBlue, to: CustomColors.ocean, locations: [0,1], in: self.view)
        //subviews
        setupSubviews()
    }
    
    //MARK: - Helpers
    
    func setupSubviews() {
    }
    
    //MARK: - Subviews
    
}
