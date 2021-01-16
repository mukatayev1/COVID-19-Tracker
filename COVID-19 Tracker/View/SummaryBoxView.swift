//
//  SummaryBoxView.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2021/01/08.
//

import UIKit

class SummaryBoxView: UIView {
    
    let numberLabel: UILabel = {
        let tv = UILabel()
        tv.textColor = .white
        tv.font = UIFont.systemFont(ofSize: 28)
        return tv
    }()
    
    let nameLabel: UILabel = {
       let tv = UILabel()
        tv.text = "TextLabel"
        tv.textColor = UIColor.white
        tv.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return tv
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
        
    }
}
