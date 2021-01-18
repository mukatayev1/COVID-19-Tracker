//
//  SummaryBoxView.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2021/01/08.
//

import UIKit

class SummaryBoxView: UIView {
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 28)
        return label
    }()
    
    let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "TextLabel"
        label.textColor = UIColor.white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    let changesLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.clear
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemTeal
        self.layer.cornerRadius = 18
        subviewElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Subviews
    func subviewElements() {
        addSubview(nameLabel)
        nameLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 5, paddingLeft: 10)
        
        addSubview(numberLabel)
        numberLabel.centerX(inView: self)
        numberLabel.centerY(inView: self)
        
        addSubview(changesLabel)
        changesLabel.anchor(top: numberLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 10, paddingRight: 10)
        
    }
}
