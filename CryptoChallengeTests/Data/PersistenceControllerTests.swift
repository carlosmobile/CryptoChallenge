//
//  PersistenceControllerTests.swift
//  CryptoChallengeTests
//
//  Created by Carlos Butron on 21/2/24.
//

import XCTest
@testable import CryptoChallenge

class PersistenceControllerTests: XCTestCase {

    func testInMemoryContainerInitialization() {
        let controller = PersistenceController(inMemory: true)
        
        XCTAssertNotNil(controller.container)
        
        let storeURL = controller.container.persistentStoreDescriptions.first?.url
        XCTAssertEqual(storeURL, URL(fileURLWithPath: "/dev/null"))
    }
    
    func testPersistentContainerInitialization() {
        let controller = PersistenceController()
        
        XCTAssertNotNil(controller.container)
        
        let storeURL = controller.container.persistentStoreDescriptions.first?.url
        XCTAssertNotEqual(storeURL, URL(fileURLWithPath: "/dev/null"))
        
        XCTAssertEqual(controller.container.name, "CryptoCurrencyData")
    }
}

