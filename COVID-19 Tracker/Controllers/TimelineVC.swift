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
    
    private let containerView: UIView = {
        let container = UIView()
        container.backgroundColor = .clear
        return container
    }()
    
    private let confirmedBox: SummaryBoxView = {
        let v = SummaryBoxView()
        v.backgroundColor = CustomColors.purple
        v.nameLabel.text = "Confirmed"
        return v
    }()
    
    private let criticalBox: SummaryBoxView = {
        let v = SummaryBoxView()
        v.backgroundColor = CustomColors.purple
        v.nameLabel.text = "Critical"
        return v
    }()
    
    private let deathsBox: SummaryBoxView = {
        let v = SummaryBoxView()
        v.backgroundColor = CustomColors.ocean
        v.nameLabel.text = "Deaths"
        return v
    }()
    
    private let recoveredBox: SummaryBoxView = {
        let v = SummaryBoxView()
        v.backgroundColor = CustomColors.ocean
        v.nameLabel.text = "Recovered"
        return v
    }()
    
    private let lastUpdateLabel: UILabel = {
        let label = UILabel()
        label.text = "Latest Update: 11/11/2021"
        label.textColor = CustomColors.lightGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        summaryService.getSummary { (summary) in
            if let summary = summary {
                DispatchQueue.main.async {
                    self.confirmedBox.numberLabel.text = String(summary.confirmed)
                    self.criticalBox.numberLabel.text = String(summary.critical)
                    self.deathsBox.numberLabel.text = String(summary.deaths)
                    self.recoveredBox.numberLabel.text = String(summary.recovered)
                }
            }
        }
        
        //subviews
        setupView()
    }
    
    //MARK: - Helpers
    
    func setupView() {
        setupGradientLayer(from: CustomColors.darkBlue, to: CustomColors.ocean, locations: [0,1], in: self.view)
        subviewElements()
    }
    
    //MARK: - Subviews
    
    func subviewElements() {
        view.addSubview(containerView)
        containerView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 10, height: 250)
        
        view.addSubview(confirmedBox)
        confirmedBox.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: containerView.centerYAnchor, right: view.centerXAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 5, paddingRight: 5)
        
        view.addSubview(criticalBox)
        criticalBox.anchor(top: containerView.topAnchor, left: containerView.centerXAnchor, bottom: containerView.centerYAnchor, right: containerView.rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 10)
//
        view.addSubview(deathsBox)
        deathsBox.anchor(top: containerView.centerYAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.centerXAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 5, paddingRight: 5)
//
        view.addSubview(recoveredBox)
        recoveredBox.anchor(top: containerView.centerYAnchor, left: containerView.centerXAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 10)
        
        view.addSubview(lastUpdateLabel)
        lastUpdateLabel.anchor(top: containerView.bottomAnchor, left: view.leftAnchor, paddingLeft: 10, width: 200, height: 30)
    }
    
}

//MARK: - Alamofire
