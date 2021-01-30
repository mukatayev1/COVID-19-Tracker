//
//  MyCountryCellCell.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2021/01/25.
//

import UIKit
import SnapKit

class ChooseCountryCell: UITableViewCell {
    //MARK: - properties
    
    let chooseCountryLabel: UILabel = {
       let label = UILabel()
        label.text = "Choose country"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    let arrowImageView: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(systemName: "arrowtriangle.down.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 18, weight: .regular))
        iv.tintColor = CustomColors.purple
        return iv
    }()
    
    //MARK: - lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        subviewElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - helpers
    
    func subviewElements() {
        //chooseCountryLabel
        contentView.addSubview(chooseCountryLabel)
        chooseCountryLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        //arrowImageView
        contentView.addSubview(arrowImageView)
        arrowImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(chooseCountryLabel.snp.right).offset(8)
        }
    }
    
    //MARK: - Selectors

}
