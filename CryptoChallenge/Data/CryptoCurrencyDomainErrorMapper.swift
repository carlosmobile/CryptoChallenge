//
//  CryptoCurrencyDomainErrorMapper.swift
//  CryptoChallenge
//
//  Created by Carlos Butron on 18/2/24.
//

import Foundation

class CryptoCurrencyDomainErrorMapper {
    func map(error: HTTPClientError?) -> CryptoCurrencyDomainError {
        return .generic
    }
}
