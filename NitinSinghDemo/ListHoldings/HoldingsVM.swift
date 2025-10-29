//
//  HoldingsVM.swift
//  NitinSinghDemo
//
//  Created by Nitin Kumar Singh on 28/10/25.
//

import Foundation

struct PortfolioSummary {
    let currentValue: Double
    let totalInvestment: Double
    let pnlToday: Double
    let pnlTotal: Double
    
    fileprivate init(portfolio: Portfolio) {
        currentValue = portfolio.currentValue
        totalInvestment = portfolio.totalInvestment
        pnlToday = portfolio.pnlToday
        pnlTotal = portfolio.pnlTotal
    }
}

class HoldingsViewModel {
    private let loader: HoldingsLoader
    private var holdings: [Holding]
    
    init(loader: HoldingsLoader) {
        self.loader = loader
        self.holdings = []
    }
    
    func getHoldings() async throws -> [Holding] {
        holdings = try await loader.load()
        return holdings
    }
    
    func getPortfolioSummary() -> PortfolioSummary {
        let portfolio = Portfolio(holdings: holdings)
        return PortfolioSummary(portfolio: portfolio)
    }
}
