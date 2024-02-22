//
//  ApiDataSourceType.swift
//  CryptoChallenge
//
//  Created by Carlos Butron on 18/2/24.
//

import Foundation

protocol ApiDataSourceType {
    func getCryptoList(page: Int) async -> Result<(cryptoList: [CryptoCurrency], paginationInfo: CryptoCurrencyPaginationInfo), HTTPClientError>
}
