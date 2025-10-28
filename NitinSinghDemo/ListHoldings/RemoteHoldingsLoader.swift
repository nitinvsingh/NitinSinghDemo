//
//  RemoteHoldingsLoader.swift
//  NitinSinghDemo
//
//  Created by Nitin Kumar Singh on 28/10/25.
//

import Foundation

enum RemoteHoldingsLoaderError: Error {
    case invalidRequest
    case remoteUnavailable
    case invalidData
}

struct RemoteResponse: Decodable {
    let data: [Holding]
    
    enum CodingKeys: CodingKey {
        case data
    }
    
    enum PortfolioCodingKeys: String, CodingKey {
        case holdings = "userHolding"
    }
    
    enum RemoteHoldingCodingKeys: String, CodingKey {
        case symbol
        case quantity
        case lastTradedPrice = "ltp"
        case averagePrice = "avgPrice"
        case closingPrice = "close"
    }
    
    init(from decoder: any Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
        let portfolioContainer = try rootContainer.nestedContainer(keyedBy: PortfolioCodingKeys.self, forKey: .data)
        var holdingContainer = try portfolioContainer.nestedUnkeyedContainer(forKey: .holdings)
        var holdings = [Holding]()
        while !holdingContainer.isAtEnd {
            let holdingData = try holdingContainer.nestedContainer(keyedBy: RemoteHoldingCodingKeys.self)
            let symbol = try holdingData.decode(String.self, forKey: .symbol)
            let quantity = try holdingData.decode(Int.self, forKey: .quantity)
            let lastTradedPrice = try holdingData.decode(Double.self, forKey: .lastTradedPrice)
            let averagePrice = try holdingData.decode(Double.self, forKey: .averagePrice)
            let closingPrice = try holdingData.decode(Double.self, forKey: .closingPrice)
            holdings.append(Holding(symbol: symbol, quantity: Double(quantity), lastTradedPrice: lastTradedPrice, averagePrice: averagePrice, closingPrice: closingPrice))
        }
        self.data = holdings
    }
}

class RemoteHoldingsLoader: HoldingsLoader {
    
    func load() async throws -> [Holding] {
        guard let url = URL(string: "https://35dee773a9ec441e9f38d5fc249406ce.api.mockbin.io/") else {
            throw RemoteHoldingsLoaderError.invalidRequest
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            print(response)
            let remoteResponse = try JSONDecoder().decode(RemoteResponse.self, from: data)
            return remoteResponse.data
        } catch {
            throw RemoteHoldingsLoaderError.invalidData
        }
    }
}
