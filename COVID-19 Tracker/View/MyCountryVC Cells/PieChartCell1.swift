//
//  PieChartCell1.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2021/01/30.
//

import UIKit
import Charts
import SnapKit

class PieChartCell1: UITableViewCell {
    //MARK: - Properties

    let pieChart = PieChartView()

    let deathsDataEntry = PieChartDataEntry()
    let recoveredDataEntry = PieChartDataEntry()
    let criticalDataEntry = PieChartDataEntry()
    
    var totalDataEntries = [PieChartDataEntry]()
    
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
    
    func constructPieChart(deathsValue: Double, recoveredValue: Double, criticalValue: Double) {
        let chartData = PieChartData(dataSet: setupPieChart())
        
        self.deathsDataEntry.value = deathsValue
        self.recoveredDataEntry.value = recoveredValue
        self.criticalDataEntry.value = criticalValue
        
        self.pieChart.data = chartData
    }
    
    func setupPieChart() -> PieChartDataSet {
        setupPieChartLegend()
    
        deathsDataEntry.label = "Deaths"
        recoveredDataEntry.label = "Recovered"
        criticalDataEntry.label = "Critical"
        
        let colors = [UIColor.systemRed, UIColor.systemGreen, #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)]
        
        totalDataEntries = [deathsDataEntry, recoveredDataEntry, criticalDataEntry]
        
        let chartDataSet = PieChartDataSet(entries: totalDataEntries, label: nil)
        chartDataSet.colors = colors
        chartDataSet.drawValuesEnabled = false
        chartDataSet.highlightColor = .white
        chartDataSet.entryLabelFont = UIFont.systemFont(ofSize: 10, weight: .regular)
        
        pieChart.transparentCircleColor = CustomColors.ocean
        pieChart.holeColor = .clear
        
        return chartDataSet
    }
    
    func setupPieChartLegend() {
        pieChart.legend.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        pieChart.legend.form = .circle
        pieChart.legend.textColor = .systemGray
        pieChart.legend.verticalAlignment = .top
        pieChart.legend.horizontalAlignment = .left
        pieChart.legend.orientation = .vertical
        
    }

    //MARK: - Subviews
    
    func subviewElements() {
        contentView.addSubview(pieChart)
        pieChart.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
