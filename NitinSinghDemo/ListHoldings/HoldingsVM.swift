//
//  HoldingsVM.swift
//  NitinSinghDemo
//
//  Created by Nitin Kumar Singh on 28/10/25.
//

import Foundation

class HoldingsViewModel {
    private let loader: HoldingsLoader
    
    init(loader: HoldingsLoader) {
        self.loader = loader
    }
    
    func getHoldings() async throws -> [Holding] {
        return try await loader.load()
    }
}
