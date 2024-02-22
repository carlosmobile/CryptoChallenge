//
//  CryptoDetailFactory.swift
//  CryptoChallenge
//
//  Created by Carlos Butron on 19/2/24.
//

import Foundation

class CryptoDetailFactory {
    static func create(with crypto: CryptoCurrency) -> CryptoDetailView {
        return CryptoDetailView(viewModel: createViewModel(with: crypto))
    }
    
    private static func createViewModel(with crypto: CryptoCurrency) -> CryptoDetailViewModel {
        return CryptoDetailViewModel(crypto: crypto)
    }
}
