//
//  CryptoListViewModel.swift
//  CryptoChallenge
//
//  Created by Carlos Butron on 18/2/24.
//

import Foundation

class CryptoListViewModel: ObservableObject {
    @Published var cryptos: [CryptoCurrency] = []
    @Published var isLoading = false
    @Published var showErrorMessage: String?
    private let getCryptoList: GetCryptoListType
    private var paginationInfo: CryptoCurrencyPaginationInfo?
    private var currentPage = 0
    private let errorMapper: CryptocurrencyPresentableErrorMapper
    
    init(getCryptoList: GetCryptoListType, errorMapper: CryptocurrencyPresentableErrorMapper) {
        self.getCryptoList = getCryptoList
        self.errorMapper = errorMapper
    }
    
    func onAppear() {
        guard self.cryptos.isEmpty else { return }
        isLoading = true
        loadData()
    }
    
    func loadData() {
        Task {
            let result = await getCryptoList.execute(page: currentPage)
            switch result {
            case .success(let (cryptoList, paginationInfo)):
                Task { @MainActor in
                    if self.cryptos.isEmpty {
                        self.cryptos = cryptoList
                        self.paginationInfo = paginationInfo
                    } else {
                        self.cryptos.append(contentsOf: cryptoList)
                        self.paginationInfo = paginationInfo
                    }
                    self.isLoading = false
                }
            case .failure(let error):
                isLoading = false
                handleError(error: error)
            }
        }
    }
        
    func shouldLoadMoreData(currentItem: CryptoCurrency?) -> Bool {
        guard let currentItem = currentItem else { return false }
        if let lastItem = cryptos.last, lastItem.id == currentItem.id {
            return true
        }
        return false
    }
    
    func loadMoreData() {
        guard !isLoading && hasMoreData() else { return }
        isLoading = true
        currentPage += 1
        loadData()
    }
    
    private func hasMoreData() -> Bool {
        return currentPage != paginationInfo?.numberPages
    }
    
    private func handleError(error: CryptoCurrencyDomainError?) {
        Task { @MainActor in
            showErrorMessage = errorMapper.map(error: error)
        }
    }
}
