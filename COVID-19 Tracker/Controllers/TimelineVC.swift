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
    
    let summaryService = SummaryService()
    
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
        setupGradientLayer(from: CustomColors.darkBlue, to: CustomColors.ocean, locations: [0,1], in: self.view)
        setupTableView()
        setupIndicatorView()
        activityIndicator.startAnimating()
        subviewElements()
        
        summaryService.checkServiceResult { (response) in
            self.activityIndicator.stopAnimating()
        }
    }
    
    //MARK: - Helpers
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(DataZeroCell.self, forCellReuseIdentifier: CellIdentifiers.dataZeroIdentifier)
        tableView.register(DataOneCell.self, forCellReuseIdentifier: CellIdentifiers.dataOneIdentifier)
        tableView.register(DataTwoCell.self, forCellReuseIdentifier: CellIdentifiers.dataTwoIdentifier)
        tableView.register(DataThreeCell.self, forCellReuseIdentifier: CellIdentifiers.dataThreeIdentifier)
        tableView.register(DataFourCell.self, forCellReuseIdentifier: CellIdentifiers.dataFourIdentifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellIdentifiers.defaultIdentifier)
    }
    
    func setupIndicatorView() {
        activityIndicator.style = .medium
        activityIndicator.color = .white
    }
    
    func subviewElements() {
        view.addSubview(tableView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor)
        
        view.addSubview(activityIndicator)
        activityIndicator.centerX(inView: view)
        activityIndicator.centerY(inView: view)
    }
}

//MARK: - Extensions

extension TimelineVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.dataZeroIdentifier, for: indexPath)
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.dataOneIdentifier, for: indexPath)
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.dataTwoIdentifier, for: indexPath)
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.dataThreeIdentifier, for: indexPath)
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.dataFourIdentifier, for: indexPath)
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
            return 50
        } else if indexPath.row == 1 {
            return 220
        } else if indexPath.row == 2 {
            return 220
        } else if indexPath.row == 3 {
            return 40
        } else if indexPath.row == 4 {
            return 300
        } else {
            return 40
        }
    }
    
    
    
}
