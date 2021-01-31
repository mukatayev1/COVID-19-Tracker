//
//  DataTwoCell.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2021/01/15.
//

import UIKit
import SnapKit

class DataTwoCell: UITableViewCell {
    
    //MARK: - Properties
    
    let summaryService = TotalDataService()
    
    private let criticalBox: SummaryBoxView = {
        let v = SummaryBoxView()
        v.nameLabel.text = "Critical"
        v.numberLabel.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        v.changesLabel.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        return v
    }()
    
    private let testedBox: SummaryBoxView = {
        let v = SummaryBoxView()
        v.nameLabel.text = "Tested"
        v.changesLabel.textColor = .black
        return v
    }()
    
    private let deathRatioBox: SummaryBoxView = {
        let v = SummaryBoxView()
        v.nameLabel.text = "Death Ratio"
        v.numberLabel.textColor = .systemRed
        return v
    }()
    
    private let recoveryRatioBox: SummaryBoxView = {
        let v = SummaryBoxView()
        v.nameLabel.text = "Recovery Ratio"
        v.numberLabel.textColor = .systemGreen
        return v
    }()
    
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        subviewElements()
        fetchSummary()
        fetchChanges()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func fetchSummary() {
        summaryService.getSummary { (summary) in
            
            if let summary = summary {
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
    }
    
    func fetchChanges() {
        summaryService.getChanges { (changes) in
            
            if let changes = changes {
                let criticalChangesText = self.decimate(number: changes.critical)
                let testedChangesText = self.decimate(number: changes.tested)
                
                self.criticalBox.changesLabel.text = "\(criticalChangesText!)"
                self.testedBox.changesLabel.text = "+\(testedChangesText!)"
            }
        }
    }
    
    func decimate(number: Int) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formattedNumber = numberFormatter.string(from: NSNumber(value: number))
        
        return formattedNumber
    }
    
    //MARK: - Subviews
    
    func subviewElements() { 
        
        contentView.addSubview(criticalBox)
        criticalBox.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(10)
            make.bottom.equalTo(contentView.snp.centerY).offset(-5)
            make.right.equalTo(contentView.snp.centerX).offset(-5)
        }
        
        contentView.addSubview(testedBox)
        testedBox.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalTo(contentView.snp.centerX).offset(5)
            make.bottom.equalTo(contentView.snp.centerY).offset(-5)
            make.right.equalTo(contentView.snp.right).offset(-10)
        }
        
        contentView.addSubview(deathRatioBox)
        deathRatioBox.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.centerY).offset(5)
            make.left.equalTo(contentView.snp.left).offset(10)
            make.bottom.equalTo(contentView.snp.bottom).offset(-5)
            make.right.equalTo(contentView.snp.centerX).offset(-5)
        }
        
        contentView.addSubview(recoveryRatioBox)
        recoveryRatioBox.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.centerY).offset(5)
            make.left.equalTo(contentView.snp.centerX).offset(5)
            make.bottom.equalTo(contentView.snp.bottom).offset(-5)
            make.right.equalTo(contentView.snp.right).offset(-10)
        }
    }
    
}
