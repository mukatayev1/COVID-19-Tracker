//
//  SummaryBoxView.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2021/01/08.
//

import UIKit
import SnapKit

class SummaryBoxView: UIView {
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "#####"
        label.font = UIFont.systemFont(ofSize: 28)
        return label
    }()
    
    let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "TextLabel"
        label.textAlignment = .left
        label.textColor = .darkGray
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
        self.backgroundColor = .systemBackground
        self.layer.cornerRadius = 18
        subviewElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Subviews
    func subviewElements() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5)
            make.left.equalToSuperview().offset(10)
        }
        
        addSubview(numberLabel)
        numberLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        addSubview(changesLabel)
        changesLabel.snp.makeConstraints { (make) in
            make.top.equalTo(numberLabel.snp.bottom).offset(5)
            make.left.right.equalToSuperview().inset(10)
        }
    }
}
