//
//  HoldingValueTests.swift
//  NitinSinghDemoTests
//
//  Created by Nitin Kumar Singh on 27/10/25.
//

import XCTest
@testable import NitinSinghDemo

struct HoldingValue {
    
}

final class HoldingValueTests: XCTestCase {
    
    var holdings: [Holding] = [
            Holding(symbol: "RELIANCE", quantity: 50, lastTradedPrice: 2500, averagePrice: 2450, closingPrice: 2600),
            Holding(symbol: "HDFC", quantity: 75, lastTradedPrice: 1800.25, averagePrice: 1750, closingPrice: 1700),
            Holding(symbol: "MARUTI", quantity: 30, lastTradedPrice: 7000, averagePrice: 6800, closingPrice: 7200),
            Holding(symbol: "TCS", quantity: 150, lastTradedPrice: 3500, averagePrice: 3400, closingPrice: 3300)
        ]
    
    var holding: Holding {
        return holdings.randomElement()!
    }

    func testHoldingValue() {
        let holding = holding
        let currentValue = holding.lastTradedPrice * holding.quantity
        let totalInvesetment = holding.averagePrice * holding.quantity
        let pnlToday = holding.closingPrice - holding.lastTradedPrice
        let pnlTotal = (holding.lastTradedPrice * holding.quantity) - (holding.averagePrice * holding.quantity)
        XCTAssertTrue(currentValue == holding.currentValue, message(expected: currentValue, got: holding.currentValue))
        XCTAssertTrue(totalInvesetment == holding.totalInvesetment, message(expected: totalInvesetment, got: holding.totalInvesetment))
        XCTAssertTrue(pnlToday == holding.pnlToday, message(expected: pnlToday, got: holding.pnlToday))
        XCTAssertTrue(pnlTotal == holding.pnlTotal, message(expected: pnlTotal, got: holding.pnlTotal))
    }
    
    private func message<T: CustomStringConvertible>(expected: T, got actual: T) -> String {
        return "Expected: \(expected) | got: \(actual)"
    }
    
}
