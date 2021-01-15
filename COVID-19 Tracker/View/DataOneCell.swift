//
//  DataOneCell.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2021/01/12.
//

import UIKit

class DataOneCell: UITableViewCell {
    
    //MARK: - Properties
    
    let summaryService = Service()
    
    private let confirmedBox: SummaryBoxView = {
        let v = SummaryBoxView()
        v.backgroundColor = CustomColors.purple
        v.nameLabel.text = "Confirmed"
        return v
    }()
    
    private let location: SummaryBoxView = {
        let v = SummaryBoxView()
        v.backgroundColor = CustomColors.purple
        v.nameLabel.text = "Location"
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
    
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        subviewElements()
        summaryService.getSummary { (result) in
            
            self.confirmedBox.numberLabel.text = result?.data.confirmedLabelText
            self.deathsBox.numberLabel.text = result?.data.deathsLabelText
            self.recoveredBox.numberLabel.text = result?.data.recoveredLabelText
            self.location.numberLabel.text = result?.data.locationLabelText
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    
    //MARK: - Subviews
    
    func subviewElements() {
        
        addSubview(confirmedBox)
        confirmedBox.anchor(top: topAnchor, left: leftAnchor, bottom: centerYAnchor, right: centerXAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 5, paddingRight: 5)
        
        addSubview(location)
        location.anchor(top: topAnchor, left: centerXAnchor, bottom: centerYAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 5, paddingBottom: 5, paddingRight: 10)
        //
        addSubview(deathsBox)
        deathsBox.anchor(top: centerYAnchor, left: leftAnchor, bottom: bottomAnchor, right: centerXAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 5, paddingRight: 5)
        //
        addSubview(recoveredBox)
        recoveredBox.anchor(top: centerYAnchor, left: centerXAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 10)
    }
    
}
