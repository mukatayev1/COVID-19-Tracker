//
//  ChartCell.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2021/01/19.
//

import UIKit

class ChartCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    let countryName: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    let totalCases: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    let deaths: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .systemRed
        return label
    }()
    
    let recovered: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .systemGreen
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.setHeight(height: 50)
        subviewElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func subviewElements() {
        contentView.addSubview(countryName)
        countryName.anchor(left: leftAnchor, paddingLeft: 5, width: 100)
        countryName.centerY(inView: contentView)
        
        
        
        let stackElements = [totalCases, deaths, recovered]
        let stack = UIStackView(arrangedSubviews: stackElements)
        stack.alignment = .center
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 30
        
        contentView.addSubview(stack)
        stack.centerY(inView: contentView)
        stack.anchor(left: countryName.rightAnchor, right: rightAnchor, paddingLeft: 5, paddingRight: 5)
    }
}
