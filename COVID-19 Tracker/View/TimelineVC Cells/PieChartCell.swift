//
//  DataFourCell.swift
//  COVID-19 Tracker
//
//  Created by AZM on 2021/01/17.
//

import UIKit
import Charts

class PieChartCell: UITableViewCell {

    //MARK: - Properties
    
    let summaryService = SummaryService()
    let pieChart = PieChartView()
    
    let activeCasesDataEntry = PieChartDataEntry()
    let deathsDataEntry = PieChartDataEntry()
    let recoveredDataEntry = PieChartDataEntry()
    let criticalDataEntry = PieChartDataEntry()
    
    var totalDataEntries = [PieChartDataEntry]()
    
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        subviewElements()
        let chartData = PieChartData(dataSet: setupPieChart())
        
        summaryService.getSummary { (summary) in
            
            if let summary = summary {
                self.activeCasesDataEntry.value = Double(summary.activeCases)
                self.deathsDataEntry.value = Double(summary.deaths)
                self.recoveredDataEntry.value = Double(summary.recovered)
                self.criticalDataEntry.value = Double(summary.critical)
                
                self.pieChart.data = chartData
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func setupPieChart() -> PieChartDataSet{
        setupPieChartLegend()
        
        activeCasesDataEntry.label = "Active"
        deathsDataEntry.label = "Deaths"
        recoveredDataEntry.label = "Recovered"
        criticalDataEntry.label = "Critical"
        
        let colors = [CustomColors.purple, UIColor.systemRed, UIColor.systemGreen, #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)]
        
        totalDataEntries = [activeCasesDataEntry, deathsDataEntry,
                            recoveredDataEntry, criticalDataEntry]
        
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
        pieChart.legend.textColor = .white
        pieChart.legend.verticalAlignment = .top
        pieChart.legend.horizontalAlignment = .left
        pieChart.legend.orientation = .vertical
        
    }

    //MARK: - Subviews
    
    func subviewElements() {
        addSubview(pieChart)
        pieChart.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }
    
}
