//
//  CryptoDetailViewModelTests.swift
//  CryptoChallengeTests
//
//  Created by Carlos Butron on 21/2/24.
//

import XCTest
@testable import CryptoChallenge

final class CryptoDetailViewModelTests: XCTestCase {

    func testConvertCurrencyStringToDouble() {
        let viewModel = CryptoDetailViewModel(crypto: CryptoCurrency(id: "1", name: "Bitcoin", logoImage: "", symbol: "BTC", value: "€1,000", volume24h: ""))
        
        let convertedValue = viewModel.convertCurrencyStringToDouble("€1,000")
        XCTAssertEqual(convertedValue, 1000.0)
    }
    
    func testComputeValueWithNonEmptyValue() {
        let crypto = CryptoCurrency(id: "1", name: "Bitcoin", logoImage: "", symbol: "BTC", value: "€2,000", volume24h: "")
        let viewModel = CryptoDetailViewModel(crypto: crypto)
        viewModel.userInputString = "1000"
        
        viewModel.computeValue()
        
        XCTAssertEqual(viewModel.computedValue, 0.5)
    }
    
    func testComputeValueWithEmptyValue() {
        let crypto = CryptoCurrency(id: "1", name: "Bitcoin", logoImage: "", symbol: "BTC", value: "", volume24h: "")
        let viewModel = CryptoDetailViewModel(crypto: crypto)
        viewModel.userInputString = "1000"
        
        viewModel.computeValue()
        
        XCTAssertEqual(viewModel.computedValue, 0)
    }

}
