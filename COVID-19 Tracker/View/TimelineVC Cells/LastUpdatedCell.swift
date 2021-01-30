//
//  DataThreeCell.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2021/01/16.
//

import UIKit

class LastUpdatedCell: UITableViewCell {

    //MARK: - Properties
    
    let summaryService = TotalDataService()
    
    private let lastUpdateLabel: UILabel = {
        let label = UILabel()
        label.textColor = CustomColors.lightGray
        label.text = "Latest Update:"
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = CustomColors.lightGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        return label
    }()
    
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = .current
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        formatter.dateFormat = "MMM d, h:mm a"
        return formatter
    }()
    
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        subviewElements()
        fetchTime()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func fetchTime() {
        summaryService.getTime { (time) in
            
            if let time = time {
                let latestUpdateInSeconds = TimeInterval(time)
                let latestUpdateText = self.convertDateToString(from: latestUpdateInSeconds)

                self.dateLabel.text = latestUpdateText
            }
        }
    }
    
    func convertDateToString(from timeInterval: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: timeInterval)
        let stringFromDate = formatter.string(from: date)
        
        return stringFromDate
    }
    
    //MARK: - Subviews
    
    func subviewElements() {
        addSubview(lastUpdateLabel)
        lastUpdateLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, paddingLeft: 15, width: 100)
        
        addSubview(dateLabel)
        dateLabel.anchor(top: topAnchor, left: lastUpdateLabel.rightAnchor, bottom: bottomAnchor, paddingLeft: 5)
    }
    
}

