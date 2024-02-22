//
//  CryptoCurrencyPaginationInfoTests.swift
//  CryptoChallengeTests
//
//  Created by Carlos Butron on 21/2/24.
//

import XCTest
@testable import CryptoChallenge

final class CryptoCurrencyPaginationInfoTests: XCTestCase {

    func testPaginationInfoCalculation() {
        let paginationInfo = CryptoCurrencyPaginationInfo(count: 100, pagination: 25)
        
        XCTAssertEqual(paginationInfo.count, 100)
        XCTAssertEqual(paginationInfo.pagination, 25)
        XCTAssertEqual(paginationInfo.numberPages, 4) 
        
        let paginationInfoOdd = CryptoCurrencyPaginationInfo(count: 101, pagination: 25)
        XCTAssertEqual(paginationInfoOdd.numberPages, 5)
    }

}
