//
//  CryptoDetailViewModel.swift
//  CryptoChallenge
//
//  Created by Carlos Butron on 19/2/24.
//

import Foundation

class CryptoDetailViewModel: ObservableObject {
    @Published var crypto: CryptoCurrency
    @Published var userInputString: String = ""
    @Published var computedValue: Double = 0
    
    var userInput: Double {
        return Double(userInputString) ?? 0
    }
    
    init(crypto: CryptoCurrency) {
        self.crypto = crypto
    }
    
    func computeValue() {
        if crypto.value.isEmpty {
            computedValue = 0
        } else {
            
            computedValue = userInput / (convertCurrencyStringToDouble(crypto.value) ?? 1)
        }
    }
    
    func convertCurrencyStringToDouble(_ currencyString: String) -> Double? {
        let cleanedString = currencyString
            .replacingOccurrences(of: "€", with: "")
            .replacingOccurrences(of: ",", with: "")
            .trimmingCharacters(in: .whitespacesAndNewlines)
        return Double(cleanedString)
    }
    
}
