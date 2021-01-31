//
//  ViewController.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2020/12/14.
//

import UIKit
import Alamofire

class WorldVC: UIViewController {
    
    //MARK: - Properties
    
    let summaryService = TotalDataService()
    
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .clear
        tv.separatorStyle = .none
        return tv
    }()
    
    let activityIndicator = UIActivityIndicatorView()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(title: "Today's Report")
        view.backgroundColor = .systemGroupedBackground
        setupTableView()
        setupIndicatorView()
        activityIndicator.startAnimating()
        subviewElements()
        
        summaryService.checkServiceResult { (response) in
            self.activityIndicator.stopAnimating()
        }
    }
    
    //MARK: - Helpers
    
    func setupIndicatorView() {
        activityIndicator.style = .medium
        activityIndicator.color = .black
    }
    
    func subviewElements() {
        view.addSubview(tableView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor)
        
        view.addSubview(activityIndicator)
        activityIndicator.centerX(inView: view)
        activityIndicator.centerY(inView: view)
    }
    //MARK: - TableView
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        registerCells()
    }
    
    func registerCells() {
        tableView.register(DataOneCell.self, forCellReuseIdentifier: CellIdentifiers.dataOneIdentifier)
        tableView.register(DataTwoCell.self, forCellReuseIdentifier: CellIdentifiers.dataTwoIdentifier)
        tableView.register(LastUpdatedCell.self, forCellReuseIdentifier: CellIdentifiers.lastUpdatedIdentifier)
        tableView.register(PieChartCell.self, forCellReuseIdentifier: CellIdentifiers.pieChartIdentifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellIdentifiers.defaultIdentifier)
    }
}

//MARK: - Extensions

extension WorldVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.dataOneIdentifier, for: indexPath)
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.dataTwoIdentifier, for: indexPath)
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.lastUpdatedIdentifier, for: indexPath)
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.pieChartIdentifier, for: indexPath)
            cell.selectionStyle = .none
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.defaultIdentifier, for: indexPath)
            cell.selectionStyle = .none
            return cell
        }  
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 220
        } else if indexPath.row == 1 {
            return 220
        } else if indexPath.row == 2 {
            return 40
        } else if indexPath.row == 3 {
            return 300
        } else {
            return 40
        }
    }
}
