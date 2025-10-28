//
//  HoldingsLoader.swift
//  NitinSinghDemo
//
//  Created by Nitin Kumar Singh on 28/10/25.
//


protocol HoldingsLoader {
    func load() async throws -> [Holding]
}
