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
    
    private let lastUpdateLabel: UILabel = {
        let label = UILabel()
        label.textColor = CustomColors.lightGray
        label.text = "Latest Update: "
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = CustomColors.lightGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        subviewElements()
        summaryService.getSummary { (result) in
            
            guard let stringTimestamp = result?.data.lastChecked else { return }
            let convertedDate = self.dateConverter(from: stringTimestamp)
            
            self.dateLabel.text = convertedDate
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func dateConverter(from string: String) -> String {
        let date = Date()

        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = .current
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
        formatter.dateStyle = .short
        formatter.timeStyle = .short

        let dateFromString = formatter.date(from: string) ?? date
        let stringFromDate = formatter.string(from: dateFromString)
        
        return stringFromDate
    }
    
    //MARK: - Subviews
    
    func subviewElements() {
        
        addSubview(lastUpdateLabel)
        lastUpdateLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, paddingLeft: 15, width: 100)
        
        addSubview(dateLabel)
        dateLabel.anchor(top: topAnchor, left: lastUpdateLabel.rightAnchor, bottom: bottomAnchor, paddingLeft: 10)
    }
    
}

