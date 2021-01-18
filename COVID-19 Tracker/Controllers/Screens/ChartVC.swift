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
    
    let service = CountriesService()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "World Chart"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var filteredCandies: [Country] = []
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientLayer(from: CustomColors.darkBlue, to: CustomColors.ocean, locations: [0,1], in: self.view)
        setupSearchController()
        service.getCountries()
        //subviews
        setupSubviews()
    }
    
    //MARK: - Helpers
    
    func setupSearchController() {
        // 1
        searchController.searchResultsUpdater = self
        // 2
        searchController.obscuresBackgroundDuringPresentation = false
        // 3
        searchController.searchBar.placeholder = "Search Countries"
        // 4
        navigationItem.searchController = searchController
        // 5
        definesPresentationContext = true
    }
    
    //MARK: - Subviews
    
    func setupSubviews() {
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingLeft: 15, height: 50)
    }
}

extension ChartVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        //TODO
    }
    
    
}
