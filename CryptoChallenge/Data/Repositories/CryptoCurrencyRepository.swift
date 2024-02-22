//
//  CryptoCurrencyRepository.swift
//  CryptoChallenge
//
//  Created by Carlos Butron on 18/2/24.
//

import Foundation

class CryptoCurrencyRepository: CryptoListRepositoryType {
    
    private let apiDataSource: ApiDataSourceType
    private let localDataSource: LocalDataSourceType
    private let errorMapper: CryptoCurrencyDomainErrorMapper
    
    init(apiDataSource: ApiDataSourceType, localDataSource: LocalDataSourceType, errorMapper: CryptoCurrencyDomainErrorMapper) {
        self.apiDataSource = apiDataSource
        self.localDataSource = localDataSource
        self.errorMapper = errorMapper
    }
    
    func getCryptoList(page: Int) async -> Result<(cryptoList: [CryptoCurrency], paginationInfo: CryptoCurrencyPaginationInfo), CryptoCurrencyDomainError> {
        let cryptoListResult = await apiDataSource.getCryptoList(page: page)
        
        switch cryptoListResult {
        case .success(let (cryptoList, paginationInfo)):
            await saveCryptoList(cryptoList)
            return .success((cryptoList: cryptoList, paginationInfo: paginationInfo))
        case .failure(let apiError):
            let localDataResult = await localDataSource.getCryptoList(page: page)
            switch localDataResult {
            case .success(let (cryptoList, paginationInfo)):
                return .success((cryptoList: cryptoList, paginationInfo: paginationInfo))
            case .failure:
                return .failure(errorMapper.map(error: apiError))
            }
        }
    }
    
    func saveCryptoList(_ cryptoList: [CryptoCurrency]) async {
        await localDataSource.saveCryptoList(cryptoList)
    }
}
