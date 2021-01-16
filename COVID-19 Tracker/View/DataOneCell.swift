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
    
    private let totalCasesBox: SummaryBoxView = {
        let v = SummaryBoxView()
        v.backgroundColor = CustomColors.purple
        v.nameLabel.text = "Total Cases"
        return v
    }()
    
    private let activeCasesBox: SummaryBoxView = {
        let v = SummaryBoxView()
        v.backgroundColor = CustomColors.purple
        v.nameLabel.text = "Active Cases"
        return v
    }()
    
    private let deathsBox: SummaryBoxView = {
        let v = SummaryBoxView()
        v.backgroundColor = CustomColors.darkBlue
        v.nameLabel.text = "Deaths"
        v.numberLabel.textColor = .systemRed
        return v
    }()
    
    private let recoveredBox: SummaryBoxView = {
        let v = SummaryBoxView()
        v.backgroundColor = CustomColors.darkBlue
        v.nameLabel.text = "Recovered"
        v.numberLabel.textColor = .systemGreen
        return v
    }()
    
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        subviewElements()
        summaryService.getSummary { (result) in
            
            guard let summary = result?.data.summary else { return }
            
            let totalCasesText = self.decimate(number: summary.totalCases)
            let activeCasesText = self.decimate(number: summary.activeCases)
            let deathsText = self.decimate(number: summary.deaths)
            let recoveredText = self.decimate(number: summary.recovered)

            self.totalCasesBox.numberLabel.text = totalCasesText
            self.activeCasesBox.numberLabel.text = activeCasesText
            self.deathsBox.numberLabel.text = deathsText
            self.recoveredBox.numberLabel.text = recoveredText
        }
    }
required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}

//MARK: - Helpers

func decimate(number: Int) -> String? {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    let formattedNumber = numberFormatter.string(from: NSNumber(value: number))
    
    return formattedNumber
}

//MARK: - Subviews

func subviewElements() {
    
    addSubview(totalCasesBox)
    totalCasesBox.anchor(top: topAnchor, left: leftAnchor, bottom: centerYAnchor, right: centerXAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 5, paddingRight: 5)
    
    addSubview(activeCasesBox)
    activeCasesBox.anchor(top: topAnchor, left: centerXAnchor, bottom: centerYAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 5, paddingBottom: 5, paddingRight: 10)
    
    addSubview(deathsBox)
    deathsBox.anchor(top: centerYAnchor, left: leftAnchor, bottom: bottomAnchor, right: centerXAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 5, paddingRight: 5)
    
    addSubview(recoveredBox)
    recoveredBox.anchor(top: centerYAnchor, left: centerXAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 10)
}

}

