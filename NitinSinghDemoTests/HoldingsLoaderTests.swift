//
//  HoldingsLoaderTests.swift
//  NitinSinghDemo
//
//  Created by Nitin Kumar Singh on 28/10/25.
//

import XCTest
@testable import NitinSinghDemo

class MockRemoteLoader: RemoteHoldingsLoader {
    
}

final class HoldingsLoaderTests: XCTestCase {
    
    func testRemoteLoadFailsWhenURLIsOfUnrelatedDomain() async throws {
        let invalidURL = URL(string: "https://amazon.com")!
        let loader: HoldingsLoader = RemoteHoldingsLoader(url: invalidURL)
        do {
            let _ = try await loader.load()
            XCTFail("Expected RemoteHoldingsLoaderError.invalidRequest error | got none")
        } catch {
            XCTAssertEqual(error as? RemoteHoldingsLoaderError, .invalidRequest)
        }
    }
    
    func testRemoteLoad() async throws {
        let validURL = URL(string: "https://35dee773a9ec441e9f38d5fc249406ce.api.mockbin.io/")!
        let loader: HoldingsLoader = RemoteHoldingsLoader(url: validURL)
        do {
            let result = try await loader.load()
            XCTAssertEqual(result.count, 25)
        } catch {
            XCTFail("Expected error: none | Generated: \(error)")
        }
    }
}
