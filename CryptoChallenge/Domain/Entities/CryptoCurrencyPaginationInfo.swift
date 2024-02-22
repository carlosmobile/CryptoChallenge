//
//  CryptoCurrencyPaginationInfo.swift
//  CryptoChallenge
//
//  Created by Carlos Butron on 21/2/24.
//

import Foundation

struct CryptoCurrencyPaginationInfo {
    let count: Int
    let pagination: Int
    let numberPages: Int
    
    init(count: Int, pagination: Int) {
        self.count = count
        self.pagination = pagination
        let pages = Double(count) / Double(pagination)
        self.numberPages = Int(ceil(pages))
    }
}
