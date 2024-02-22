//
//  LocalDataSourceType.swift
//  CryptoChallenge
//
//  Created by Carlos Butron on 20/2/24.
//

import Foundation

protocol LocalDataSourceType {
    func getCryptoList(page: Int) async -> Result<(cryptoList: [CryptoCurrency], paginationInfo: CryptoCurrencyPaginationInfo), Error>
    func saveCryptoList(_ cryptoList: [CryptoCurrency]) async
}
