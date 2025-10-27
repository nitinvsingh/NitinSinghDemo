//
//  Holding.Swift
//  NitinSinghDemo
//
//  Created by Nitin Kumar Singh on 27/10/25.
//

import Foundation

struct Holding {
    let symbol: String
    let quantity: Double
    let lastTradedPrice: Double
    let averagePrice: Double
    let closingPrice: Double
}

// MARK: - A Holding's Value
extension Holding {
    var currentValue: Double {
        lastTradedPrice * quantity
    }
    
    var totalInvestment: Double {
        averagePrice * quantity
    }
    
    var pnlTotal: Double {
        currentValue - totalInvestment
    }
    
    var pnlToday: Double {
        closingPrice - lastTradedPrice
    }
}
