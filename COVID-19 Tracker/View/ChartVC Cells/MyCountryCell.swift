//
//  MyCountryCell.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2021/01/30.
//

import UIKit
import SnapKit

class MyCountryCell: UITableViewCell {
    
    //MARK: - Properties
    
    let countryDataService = CountryDataService()

    let countryNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 35, weight: .semibold)
        return label
    }()
    
    //Confirmed
    let confirmedNamelabel: UILabel = {
       let label = UILabel()
        label.text = "Confirmed"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    let confirmedNumberlabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    //Recovered
    let recoveredNamelabel: UILabel = {
       let label = UILabel()
        label.text = "Recovered"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    let recoveredNumberlabel: UILabel = {
       let label = UILabel()
        label.textColor = .systemGreen
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        return label
    }()
    
    //Deaths
    let deathsNamelabel: UILabel = {
       let label = UILabel()
        label.text = "Deaths"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    let deathsNumberlabel: UILabel = {
       let label = UILabel()
        label.textColor = .systemRed
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        return label
    }()
    
    //Critical
    let criticalNamelabel: UILabel = {
       let label = UILabel()
        label.text = "Critical"
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    let criticalNumberlabel: UILabel = {
       let label = UILabel()
        label.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
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
    //MARK: - Subviews
    
    func subviewElements() {
        //CountryName
        contentView.addSubview(countryNameLabel)
        countryNameLabel.snp.makeConstraints { (make) in
            make.top.left.equalTo(contentView).offset(20)
        }
        
        //Confirmed
        contentView.addSubview(confirmedNamelabel)
        confirmedNamelabel.snp.makeConstraints { (make) in
            make.top.equalTo(countryNameLabel.snp.bottom).offset(20)
            make.left.equalTo(contentView).offset(20)
        }

        contentView.addSubview(confirmedNumberlabel)
        confirmedNumberlabel.snp.makeConstraints { (make) in
            make.top.equalTo(confirmedNamelabel.snp.bottom).offset(3)
            make.left.equalTo(contentView).offset(20)
        }
        
        //Stack View for names
        let arrangedNames = [recoveredNamelabel, deathsNamelabel, criticalNamelabel]
        let stackNames = UIStackView(arrangedSubviews: arrangedNames)
        stackNames.axis = .horizontal
        stackNames.distribution = .equalCentering
        
        contentView.addSubview(stackNames)
        stackNames.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.centerY).offset(30)
            make.right.left.equalTo(contentView).inset(20)
        }
        
        //Stack View for numbers
        let arrangedNumbers = [recoveredNumberlabel, deathsNumberlabel, criticalNumberlabel]
        let stackNumbers = UIStackView(arrangedSubviews: arrangedNumbers)
        stackNumbers.axis = .horizontal
        stackNumbers.distribution = .equalCentering
        
        contentView.addSubview(stackNumbers)
        stackNumbers.snp.makeConstraints { (make) in
            make.top.equalTo(stackNames.snp.bottom).offset(3)
            make.right.left.equalTo(contentView).inset(20)
        }
    }
}
