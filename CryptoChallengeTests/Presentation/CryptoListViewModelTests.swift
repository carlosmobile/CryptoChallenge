//
//  CryptoListViewModelTests.swift
//  CryptoChallengeTests
//
//  Created by Carlos Butron on 21/2/24.
//

import XCTest
@testable import CryptoChallenge

final class CryptoListViewModelTests: XCTestCase {

    func testOnAppearInitialLoad() {
        let expectation = XCTestExpectation(description: "Load cryptos")

        let mockCryptoList = [CryptoCurrency(id: "1", name: "Bitcoin", logoImage: "", symbol: "BTC", value: "50000", volume24h: "")]
        let mockPaginationInfo = CryptoCurrencyPaginationInfo(count: 100, pagination: 20)
        let getCryptoList = MockGetCryptoList(result: .success((mockCryptoList, mockPaginationInfo)))
        let viewModel = CryptoListViewModel(getCryptoList: getCryptoList, errorMapper: MockErrorMapper())

        viewModel.onAppear()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2)
        
        XCTAssertFalse(viewModel.cryptos.isEmpty)
        XCTAssertEqual(viewModel.cryptos.first?.name, "Bitcoin")
    }
    
    func testLoadMoreDataSuccess() {
        // todo
    }
    
    func testHandleError() {
        let expectation = self.expectation(description: "Handle error expectation")

        let mockErrorMapper = MockErrorMapper()
        mockErrorMapper.errorMessage = "Something went wrong"
        let getCryptoList = MockGetCryptoList(result: .failure(.generic))
        let viewModel = CryptoListViewModel(getCryptoList: getCryptoList, errorMapper: mockErrorMapper)

        viewModel.loadData()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2)
        
        XCTAssertEqual(viewModel.showErrorMessage, "Something went wrong")
    }

    
    func testShouldLoadMoreData() {
        // todo
    }

}

class MockGetCryptoList: GetCryptoListType {
    var result: Result<(cryptoList: [CryptoCurrency], paginationInfo: CryptoCurrencyPaginationInfo), CryptoCurrencyDomainError>
    
    init(result: Result<(cryptoList: [CryptoCurrency], paginationInfo: CryptoCurrencyPaginationInfo), CryptoCurrencyDomainError>) {
        self.result = result
    }
    
    func execute(page: Int) async -> Result<(cryptoList: [CryptoCurrency], paginationInfo: CryptoCurrencyPaginationInfo), CryptoCurrencyDomainError> {
        return result
    }
}

class MockErrorMapper: CryptocurrencyPresentableErrorMapper {
    var errorMessage: String?
    
    func map(error: CryptoCurrencyDomainError?) -> String? {
        return errorMessage
    }
}
