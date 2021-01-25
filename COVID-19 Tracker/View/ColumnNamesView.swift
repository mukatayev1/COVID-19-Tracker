//
//  ColumnNamesView.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2021/01/18.
//

import UIKit

class ColumnNamesView: UIView {
    
    //MARK: - Properties
    
    let countryLabel: UILabel = {
        let label = UILabel()
        label.text = "Country"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    let totalCasesLabel: UILabel = {
        let label = UILabel()
        label.text = "Total"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    let deathsLabel: UILabel = {
        let label = UILabel()
        label.text = "Deaths"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    let recoveredLabel: UILabel = {
        let label = UILabel()
        label.text = "Recovered"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupView()
        subviewElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func setupView() {
//        backgroundColor = CustomColors.darkBlue
        layer.cornerRadius = 15
    }
    
    func subviewElements() {
        let stackedViews = [countryLabel, totalCasesLabel, deathsLabel, recoveredLabel]
        
        let stack = UIStackView(arrangedSubviews: stackedViews)
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        
        addSubview(stack)
        stack.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 10, paddingRight: 10)
        stack.centerY(inView: self)
    }
    
}
