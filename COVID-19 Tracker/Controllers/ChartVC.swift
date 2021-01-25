//
//  ChartVC.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2021/01/19.
//

import UIKit
import Alamofire
import SnapKit

class ChartVC: UIViewController {
    
    //MARK: - Properties
    
    let tableView: UITableView = {
       let tv = UITableView()
        tv.backgroundColor = .clear
        tv.separatorStyle = .none
        return tv
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientLayer(from: CustomColors.darkBlue, to: CustomColors.ocean, locations: [0,1], in: self.view)
        subviewElements()
    }
    
    //MARK: - Helpers
    
    func subviewElements() {
        //tableView
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
        }
    }
    

}
