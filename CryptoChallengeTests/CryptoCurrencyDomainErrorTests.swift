//
//  CryptoCurrencyDomainErrorTests.swift
//  CryptoChallengeTests
//
//  Created by Carlos Butron on 22/2/24.
//

import XCTest
@testable import CryptoChallenge

class CryptoCurrencyDomainErrorTests: XCTestCase {
    
    func testGenericErrorCanBeInitialized() {
        let error: CryptoCurrencyDomainError = .generic
        XCTAssertNotNil(error, "Expected that the .generic error could be initialized")
    }
    
    func testTooManyRequestsErrorCanBeInitialized() {
        let error: CryptoCurrencyDomainError = .tooManyRequests
        XCTAssertNotNil(error, "Expected that the .tooManyRequests error could be initialized")
    }
    
    func testEquality() {
        XCTAssertEqual(CryptoCurrencyDomainError.generic, CryptoCurrencyDomainError.generic, "Expected .generic to be equal to .generic")
        XCTAssertEqual(CryptoCurrencyDomainError.tooManyRequests, CryptoCurrencyDomainError.tooManyRequests, "Expected .tooManyRequests to be equal to .tooManyRequests")
        XCTAssertNotEqual(CryptoCurrencyDomainError.generic, CryptoCurrencyDomainError.tooManyRequests, "Expected .generic to not be equal to .tooManyRequests")
    }
}
