//
//  CryptocurrencyPresentableErrorMapper.swift
//  CryptoChallenge
//
//  Created by Carlos Butron on 18/2/24.
//

import Foundation

class CryptocurrencyPresentableErrorMapper {
    func map(error: CryptoCurrencyDomainError?) -> String {
        guard error == .tooManyRequests else {
            return "Something went wrong"
        }
        
        return "You have exceeded the limit. Try again later"
    }
}
