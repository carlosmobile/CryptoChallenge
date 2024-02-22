//
//  ResultExtensionTests.swift
//  CryptoChallengeTests
//
//  Created by Carlos Butron on 21/2/24.
//

import XCTest
@testable import CryptoChallenge

enum TestError: Error, Equatable {
    case failureCase
}

class ResultExtensionTests: XCTestCase {
    
    func testFailureValueWhenFailed() {
        let result: Result<Void, TestError> = .failure(.failureCase)
        
        XCTAssertNotNil(result.failureValue)
        XCTAssertEqual(result.failureValue as? TestError, TestError.failureCase)
    }
    
    func testFailureValueWhenSuccess() {
        let result: Result<Void, TestError> = .success(())
        
        XCTAssertNil(result.failureValue)
    }
}
