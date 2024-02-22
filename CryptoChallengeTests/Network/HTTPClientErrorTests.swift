//
//  HTTPClientErrorTests.swift
//  CryptoChallengeTests
//
//  Created by Carlos Butron on 22/2/24.
//

import XCTest
@testable import CryptoChallenge

class HTTPClientErrorTests: XCTestCase {
    
    func testErrorCases() {
        XCTAssertNotNil(HTTPClientError.clientError, "Should be able to instantiate clientError")
        XCTAssertNotNil(HTTPClientError.serverError, "Should be able to instantiate serverError")
        XCTAssertNotNil(HTTPClientError.parsingError, "Should be able to instantiate parsingError")
        XCTAssertNotNil(HTTPClientError.tooManyRequests, "Should be able to instantiate tooManyRequests")
        XCTAssertNotNil(HTTPClientError.badURL, "Should be able to instantiate badURL")
        XCTAssertNotNil(HTTPClientError.responseError, "Should be able to instantiate responseError")
        XCTAssertNotNil(HTTPClientError.generic, "Should be able to instantiate generic")
        
        XCTAssertEqual(HTTPClientError.clientError, HTTPClientError.clientError, "Error cases should be equal to themselves")
        XCTAssertEqual(HTTPClientError.serverError, HTTPClientError.serverError, "Error cases should be equal to themselves")
        
        XCTAssertNotEqual(HTTPClientError.clientError, HTTPClientError.serverError, "Different error cases should not be equal")
        XCTAssertNotEqual(HTTPClientError.parsingError, HTTPClientError.tooManyRequests, "Different error cases should not be equal")
    }
}
