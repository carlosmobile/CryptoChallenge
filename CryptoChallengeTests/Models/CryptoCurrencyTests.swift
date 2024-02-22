//
//  CryptoCurrencyTests.swift
//  CryptoChallengeTests
//
//  Created by Carlos Butron on 21/2/24.
//

import XCTest
@testable import CryptoChallenge

final class CryptoCurrencyTests: XCTestCase {

    func testCryptoCurrencyInitialization() {
        let crypto = CryptoCurrency(id: "1", name: "Bitcoin", logoImage: "https://example.com/bitcoin.png", symbol: "BTC", value: "50000", volume24h: "1000000000")
        
        XCTAssertEqual(crypto.id, "1")
        XCTAssertEqual(crypto.name, "Bitcoin")
        XCTAssertEqual(crypto.logoImage, "https://example.com/bitcoin.png")
        XCTAssertEqual(crypto.symbol, "BTC")
        XCTAssertEqual(crypto.value, "50000")
        XCTAssertEqual(crypto.volume24h, "1000000000")
    }

}
