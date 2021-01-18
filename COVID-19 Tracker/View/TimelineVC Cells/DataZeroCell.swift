//
//  DataZeroCell.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2021/01/15.
//

import UIKit

class DataZeroCell: UITableViewCell {
    
    //MARK: - Properties
    
    let summaryService = SummaryService()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Today's Report"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        subviewElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    
    //MARK: - Subviews
    
    func subviewElements() {
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, paddingLeft: 15)
    }


}
