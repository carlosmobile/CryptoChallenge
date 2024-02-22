//
//  URLSessionErrorResolverTests.swift
//  CryptoChallengeTests
//
//  Created by Carlos Butron on 21/2/24.
//

import XCTest
@testable import CryptoChallenge

class URLSessionErrorResolverTests: XCTestCase {

    var errorResolver: URLSessionErrorResolver!
    
    override func setUpWithError() throws {
        super.setUp()
        errorResolver = URLSessionErrorResolver()
    }

    override func tearDownWithError() throws {
        errorResolver = nil
        super.tearDown()
    }
    
    func testResolveStatusCodeTooManyRequests() throws {
        let error = errorResolver.resolve(statusCode: 429)
        XCTAssertEqual(error, .tooManyRequests, "Status code 429 should be resolved to .tooManyRequests")
    }
    
    func testResolveStatusCodeClientError() throws {
        let error = errorResolver.resolve(statusCode: 400)
        XCTAssertEqual(error, .clientError, "Status code 400 should be resolved to .clientError")
    }
    
    func testResolveStatusCodeServerError() throws {
        let error = errorResolver.resolve(statusCode: 500)
        XCTAssertEqual(error, .serverError, "Status code 500 should be resolved to .serverError")
    }
    
    func testResolveGenericError() throws {
        let error = errorResolver.resolve(error: NSError(domain: "", code: 1, userInfo: nil))
        XCTAssertEqual(error, .generic, "Any NSError should be resolved to .generic")
    }
}

