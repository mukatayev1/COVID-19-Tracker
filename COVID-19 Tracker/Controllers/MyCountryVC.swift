//
//  ChartVC.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2021/01/19.
//

import UIKit
import Alamofire
import SnapKit

class MyCountryVC: UIViewController {
    
    //MARK: - Properties
    
    let tableView: UITableView = {
       let tv = UITableView()
        tv.backgroundColor = .clear
        tv.separatorStyle = .none
        return tv
    }()
    
    let countryService = CountryDataService()
    
    var chosenCountry: CountryData?
    
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
    
    func decimate(number: Int) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formattedNumber = numberFormatter.string(from: NSNumber(value: number))
        
        return formattedNumber
    }

    //MARK: - TableView
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        registerCells()
    }
    
    func registerCells() {
        tableView.register(TitleCell.self, forCellReuseIdentifier: CellIdentifiers.titleCellIdentifier)
        tableView.register(ChooseCountryCell.self, forCellReuseIdentifier: CellIdentifiers.chooseCountryIdentifier)
        tableView.register(MyCountryCell.self, forCellReuseIdentifier: CellIdentifiers.myCountryIdentifier)
        tableView.register(PieChartCell1.self, forCellReuseIdentifier: CellIdentifiers.pieChartIdentifier1)
    }
}
//MARK: - UITableViewDelegate, UITableViewDataSource

extension MyCountryVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.titleCellIdentifier, for: indexPath) as! TitleCell
            cell.selectionStyle = .none
            cell.titleLabel.text = "My Country"
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.chooseCountryIdentifier, for: indexPath) as! ChooseCountryCell
            return cell
        }
        else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.myCountryIdentifier, for: indexPath) as! MyCountryCell
            cell.selectionStyle = .none
            cell.countryNameLabel.text = chosenCountry?.country
            cell.confirmedNumberlabel.text = decimate(number: chosenCountry?.confirmed ?? 0)
            cell.criticalNumberlabel.text = decimate(number: chosenCountry?.critical ?? 0)
            cell.recoveredNumberlabel.text = decimate(number: chosenCountry?.recovered ?? 0)
            cell.deathsNumberlabel.text = decimate(number: chosenCountry?.deaths ?? 0)
            return cell
        }
        else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.pieChartIdentifier1, for: indexPath) as! PieChartCell1
            cell.selectionStyle = .none
            cell.constructPieChart(deathsValue: Double(chosenCountry?.deaths ?? 0), recoveredValue: Double(chosenCountry?.recovered ?? 0), criticalValue: Double(chosenCountry?.critical ?? 0))
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.defaultIdentifier, for: indexPath)
            return cell
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 50
        } else if indexPath.row == 1 {
            return 30
        } else if indexPath.row == 2 {
            return 280
        } else if indexPath.row == 3 {
            return 300
        } else {
            return 40
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            let vc = CountriesListVC()
            vc.delegate = self
            let navController = UINavigationController(rootViewController: vc)
            navController.modalPresentationStyle = .fullScreen
            present(navController, animated: true, completion: nil)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
//MARK: - CountriesListVCDelegate

extension MyCountryVC: CountriesListVCDelegate {
    func didSelectCountry(name: String) {
        countryService.getLatestCountryData(for: name) { (countryData) in
            guard let countryArray = countryData else { return }
            let country = countryArray[0]
            self.chosenCountry = country
            self.tableView.reloadData()
        }
    }
}
