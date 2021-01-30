//
//  CountriesListVC.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2021/01/25.
//

import UIKit

protocol CountriesListVCDelegate {
    func didSelectCountry(name: String)
}

class CountriesListVC: UITableViewController {
    //MARK: - Properties
    
    var delegate: CountriesListVCDelegate?
    
    let countriesService = CountriesListService()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var countries: [Country] = []
    var filteredCountries: [Country] = []
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
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
        setupNavigationItemButtons()
    }
    //MARK: - Helpers
    
    func setupNavigationItemButtons() {
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        self.navigationItem.rightBarButtonItem = doneBarButton
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
    func setupTableView() {
        self.tableView = UITableView(frame: self.tableView.frame, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.backgroundColor = #colorLiteral(red: 0.1538572647, green: 0.1957488685, blue: 0.2651002787, alpha: 1)
    }
    
    func setupSearchController() {
        // 1
        searchController.searchResultsUpdater = self
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
        //7
        searchController.becomeFirstResponder()
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
    //MARK: - Selectors
    
    @objc func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
}
//MARK: - UISearchResultsUpdating

extension CountriesListVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
}
//MARK: - UITableViewDelegate, UITableViewDataSource

extension CountriesListVC {
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
        cell.textLabel?.textColor = #colorLiteral(red: 0.9040365866, green: 0.9040365866, blue: 0.9040365866, alpha: 1)
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if  isFiltering {
            if let countryName = filteredCountries[indexPath.row].name {
                delegate?.didSelectCountry(name: countryName)
            }
        } else {
            if let countryName = countries[indexPath.row].name {
                delegate?.didSelectCountry(name: countryName)
            }
        }
        
        searchController.dismiss(animated: true, completion: nil)
        self.dismiss(animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
