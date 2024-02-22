//
//  CryptocurrencyPresentableErrorMapperTests.swift
//  CryptoChallengeTests
//
//  Created by Carlos Butron on 22/2/24.
//

import XCTest
@testable import CryptoChallenge

class CryptocurrencyPresentableErrorMapperTests: XCTestCase {

    func testMapTooManyRequestsError() {
        let mapper = CryptocurrencyPresentableErrorMapper()
        
        let mappedError = mapper.map(error: .tooManyRequests)
        
        XCTAssertEqual(mappedError, "You have exceeded the limit. Try again later", "El error .tooManyRequests debería mapearse al mensaje específico")
    }
    
    func testMapGenericError() {
        let mapper = CryptocurrencyPresentableErrorMapper()
        
        let mappedErrorForNil = mapper.map(error: nil)
        XCTAssertEqual(mappedErrorForNil, "Something went wrong", "Un error nil debería mapearse al mensaje genérico")
        
        let mappedErrorForAnotherCase = mapper.map(error: .generic) 
        XCTAssertEqual(mappedErrorForAnotherCase, "Something went wrong", "Cualquier otro error debería mapearse al mensaje genérico")
    }
}
