//
//  CryptoCurrencyDomainErrorMapperTests.swift
//  CryptoChallengeTests
//
//  Created by Carlos Butron on 22/2/24.
//

import XCTest
@testable import CryptoChallenge

class CryptoCurrencyDomainErrorMapperTests: XCTestCase {

    func testMapReturnsGenericForNilInput() {
        let mapper = CryptoCurrencyDomainErrorMapper()
        let result = mapper.map(error: nil)
        XCTAssertEqual(result, .generic, "Mapping nil should return .generic")
    }
    
    func testMapReturnsGenericForHTTPClientErrors() {
        let mapper = CryptoCurrencyDomainErrorMapper()
        let clientErrorResult = mapper.map(error: .clientError)
        XCTAssertEqual(clientErrorResult, .generic, "Mapping HTTPClientError.clientError should return .generic")
        
        let serverErrorResult = mapper.map(error: .serverError)
        XCTAssertEqual(serverErrorResult, .generic, "Mapping HTTPClientError.serverError should return .generic")
    }
}
