//
//  DataTwoCell.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2021/01/15.
//

import UIKit

class DataTwoCell: UITableViewCell {
    
    //MARK: - Properties
    
    let summaryService = Service()
    
    private let criticalBox: SummaryBoxView = {
        let v = SummaryBoxView()
        v.backgroundColor = CustomColors.darkBlue
        v.nameLabel.text = "Critical"
        v.numberLabel.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        return v
    }()
    
    private let testedBox: SummaryBoxView = {
        let v = SummaryBoxView()
        v.backgroundColor = CustomColors.darkBlue
        v.nameLabel.text = "Tested"
        return v
    }()
    
    private let deathRatioBox: SummaryBoxView = {
        let v = SummaryBoxView()
        v.backgroundColor = CustomColors.darkBlue
        v.nameLabel.text = "Death Ratio"
        v.numberLabel.textColor = .systemRed
        return v
    }()
    
    private let recoveryRatioBox: SummaryBoxView = {
        let v = SummaryBoxView()
        v.backgroundColor = CustomColors.darkBlue
        v.nameLabel.text = "Recovery Ratio"
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
            
            let criticalText = self.decimate(number: summary.critical)
            let testedText = self.decimate(number: summary.tested)
            let deathRatioText = String(format: "%.2f", summary.deathRatio)
            let recoveryRatioText = String(format: "%.2f", summary.recoveryRatio)

            self.criticalBox.numberLabel.text = criticalText
            self.testedBox.numberLabel.text = testedText
            self.deathRatioBox.numberLabel.text = "\(deathRatioText)%"
            self.recoveryRatioBox.numberLabel.text = "\(recoveryRatioText)%"
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
        
        addSubview(criticalBox)
        criticalBox.anchor(top: topAnchor, left: leftAnchor, bottom: centerYAnchor, right: centerXAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 5, paddingRight: 5)
        
        addSubview(testedBox)
        testedBox.anchor(top: topAnchor, left: centerXAnchor, bottom: centerYAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 5, paddingBottom: 5, paddingRight: 10)
        
        addSubview(deathRatioBox)
        deathRatioBox.anchor(top: centerYAnchor, left: leftAnchor, bottom: bottomAnchor, right: centerXAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 5, paddingRight: 5)
        
        addSubview(recoveryRatioBox)
        recoveryRatioBox.anchor(top: centerYAnchor, left: centerXAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 10)
    }
    
}

