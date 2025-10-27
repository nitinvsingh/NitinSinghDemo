//
//  Portfolio.swift
//  NitinSinghDemo
//
//  Created by Nitin Kumar Singh on 28/10/25.
//


struct Portfolio {
    var holdings: [Holding] {
        didSet {
            updateTransactionalValue()
        }
    }
    var currentValue: Double = 0
    var totalInvestment: Double = 0
    var pnlToday: Double = 0
    var pnlTotal: Double = 0
    
    init(holdings: [Holding]) {
        self.holdings = holdings
        updateTransactionalValue()
    }
    
    private mutating func updateTransactionalValue() {
        currentValue = 0.0
        totalInvestment = 0.0
        pnlToday = 0.0
        pnlTotal = 0.0
        for holding in holdings {
            currentValue += holding.currentValue
            totalInvestment += holding.totalInvestment
            pnlToday += holding.pnlToday
            pnlTotal += holding.pnlTotal
        }
    }
}
