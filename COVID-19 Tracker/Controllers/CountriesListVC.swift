//
//  CountriesListVC.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2021/01/25.
//

import UIKit

class CountriesListVC: UITableViewController {
    //MARK: - Properties
    
    let countriesService = CountriesService()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var filteredCountries: [Country] = []
    
    var countries: [Country] = []
    
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }

    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Select Country"
        self.navigationController!.navigationBar.barStyle = .black
        self.navigationController!.navigationBar.tintColor = CustomColors.purple
        
        fetchCountries()
        
        //setting up tableview
        setupTableView()
        
        //setting up searchController
        setupSearchController()
        
        //setting up backBarButtton
        let closeBarButtton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissVC))
        self.navigationItem.leftBarButtonItem = closeBarButtton
        
    }
    
    //MARK: - Helpers
    
    func setupTableView() {
        self.tableView = UITableView(frame: self.tableView.frame, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.backgroundColor = #colorLiteral(red: 0.1538572647, green: 0.1957488685, blue: 0.2651002787, alpha: 1)
    }
    
    func setupSearchController() {
        // 1
        searchController.searchResultsUpdater = self
        present(searchController, animated: true)
        searchController.automaticallyShowsSearchResultsController = true
        // 2
        searchController.obscuresBackgroundDuringPresentation = false
        // 3
        searchController.searchBar.placeholder = "Search Countries"
        // 4
        navigationItem.searchController = searchController
        // 5
        definesPresentationContext = false
        //6
        searchController.searchBar.tintColor = .white
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredCountries = countries.filter { (country: Country) -> Bool in
            return (country.name?.lowercased().contains(searchText.lowercased()) ?? false)
      }
      
      tableView.reloadData()
    }
    
    func fetchCountries() {
        countriesService.getCountryNames { (countries) in
            if let fetchedCountries = countries {
                self.countries.append(contentsOf: fetchedCountries)
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK: - selectors
    
    @objc func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - UITableViewDelegate, UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFiltering {
          return filteredCountries.count
        }

        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = CustomColors.darkBlue
        cell.textLabel?.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    
        var country = countries[indexPath.row]
        if isFiltering {
            country = filteredCountries[indexPath.row]
          } else {
            country = countries[indexPath.row]
          }
        cell.textLabel?.text = country.name
        
        return cell
    }
}

//MARK: - UISearchResultsUpdating

extension CountriesListVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
}
