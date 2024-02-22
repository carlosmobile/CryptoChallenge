//
//  GetCryptoList.swift
//  CryptoChallenge
//
//  Created by Carlos Butron on 18/2/24.
//

import Foundation

protocol GetCryptoListType {
    func execute(page: Int) async -> Result<(cryptoList: [CryptoCurrency], paginationInfo: CryptoCurrencyPaginationInfo), CryptoCurrencyDomainError>
}

class GetCryptoList: GetCryptoListType {
    private let repository: CryptoListRepositoryType
    
    init(repository: CryptoListRepositoryType) {
        self.repository = repository
    }
    
    func execute(page: Int) async -> Result<(cryptoList: [CryptoCurrency], paginationInfo: CryptoCurrencyPaginationInfo), CryptoCurrencyDomainError> {
        let result = await repository.getCryptoList(page: page)
        
        guard let (cryptoList, paginationInfo) = try? result.get() else {
            guard case .failure(let error) = result else {
                return .failure(.generic)
            }
            return .failure(error)
        }
        
        return .success((cryptoList: cryptoList, paginationInfo: paginationInfo))
    }
}
