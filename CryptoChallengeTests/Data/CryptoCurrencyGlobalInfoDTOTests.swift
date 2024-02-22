//
//  CryptoCurrencyGlobalInfoDTOTests.swift
//  CryptoChallengeTests
//
//  Created by Carlos Butron on 22/2/24.
//

import XCTest
@testable import CryptoChallenge

class CryptoCurrencyGlobalInfoDTOTests: XCTestCase {
    
    func testJSONDecoding() throws {
        let json = """
        {
            "Data": [
                {
                    "CoinInfo": {
                        "Id": "1",
                        "Name": "BTC",
                        "FullName": "Bitcoin",
                        "ImageUrl": "/images/btc.png"
                    },
                    "DISPLAY": {
                        "EUR": {
                            "PRICE": "5000",
                            "VOLUME24HOUR": "10000"
                        }
                    }
                }
            ],
            "MetaData": {
                "Count": 1
            }
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let globalInfo = try decoder.decode(CryptoCurrencyGlobalInfoDTO.self, from: json)
        
        XCTAssertEqual(globalInfo.metadata.count, 1)
        
        let cryptoData = globalInfo.data.first
        XCTAssertNotNil(cryptoData)
        XCTAssertEqual(cryptoData?.coinInfo.id, "1")
        XCTAssertEqual(cryptoData?.coinInfo.name, "BTC")
        XCTAssertEqual(cryptoData?.coinInfo.fullName, "Bitcoin")
        XCTAssertEqual(cryptoData?.coinInfo.imageUrl, "/images/btc.png")
        
        let displayInfo = cryptoData?.display?.eur
        XCTAssertNotNil(displayInfo)
        XCTAssertEqual(displayInfo?.price, "5000")
        XCTAssertEqual(displayInfo?.volume24Hour, "10000")
    }
}
