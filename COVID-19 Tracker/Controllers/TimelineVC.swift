//
//  ViewController.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2020/12/14.
//

import UIKit
import Alamofire

class TimelineVC: UIViewController {
    
    //MARK: - Properties
    
    let summaryService = Service()
    
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.register(DataOneCell.self, forCellReuseIdentifier: CellIdentifiers.dataOneIdentifier)
        tv.register(DataTwoCell.self, forCellReuseIdentifier: CellIdentifiers.dataTwoIdentifier)
        tv.register(UITableViewCell.self, forCellReuseIdentifier: CellIdentifiers.defaultIdentifier)
        tv.backgroundColor = .clear
        return tv
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientLayer(from: CustomColors.darkBlue, to: CustomColors.ocean, locations: [0,1], in: self.view)
        setupTableView()
    }
    
    //MARK: - Helpers
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor)
    }
    
    //MARK: - Subviews
    
}

extension TimelineVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.dataOneIdentifier, for: indexPath)
            cell.selectionStyle = .none
            return cell
            
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.dataTwoIdentifier, for: indexPath)
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.defaultIdentifier, for: indexPath)
            cell.selectionStyle = .none
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 220
        } else if indexPath.row == 1 {
            return 20
        } else {
            return 50
        }
    }
    
    
    
}
