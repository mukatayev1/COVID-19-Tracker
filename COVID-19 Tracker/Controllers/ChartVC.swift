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
        setupTableView()
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
    //MARK: - TableView
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        registerCells()
    }
    
    func registerCells() {
        tableView.register(TitleCell.self, forCellReuseIdentifier: CellIdentifiers.titleCellIdentifier)
        tableView.register(MyCountryCell.self, forCellReuseIdentifier: CellIdentifiers.myCountryIdentifier)
    }
}
//MARK: - UITableViewDelegate, UITableViewDataSource

extension ChartVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.titleCellIdentifier, for: indexPath) as! TitleCell
            cell.selectionStyle = .none
            cell.titleLabel.text = "Country"
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.myCountryIdentifier, for: indexPath) as!  MyCountryCell
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.defaultIdentifier, for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 50
        } else if indexPath.row == 1 {
            return 30
        } else {
            return 40
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            let vc = UINavigationController(rootViewController: CountriesListVC())
//            let vc = CountriesListVC()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
