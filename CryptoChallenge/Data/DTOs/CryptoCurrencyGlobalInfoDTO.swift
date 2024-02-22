//
//  CryptoCurrencyGlobalInfoDTO.swift
//  CryptoChallenge
//
//  Created by Carlos Butron on 18/2/24.
//

import Foundation

struct CryptoCurrencyGlobalInfoDTO: Codable {
    var data: [CryptoCurrencyData]
    var metadata: CryptoCurrencyMetaData

    enum CodingKeys: String, CodingKey {
        case data = "Data"
        case metadata = "MetaData"
    }
}

struct CryptoCurrencyMetaData: Codable {
    var count: Int

    enum CodingKeys: String, CodingKey {
        case count = "Count"
    }
}

struct CryptoCurrencyData: Codable {
    var coinInfo: CoinInfo
    var display: DisplayInfo?

    enum CodingKeys: String, CodingKey {
        case coinInfo = "CoinInfo"
        case display = "DISPLAY"
    }
}

struct CoinInfo: Codable {
    var id: String
    var name: String
    var fullName: String
    var imageUrl: String

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case fullName = "FullName"
        case imageUrl = "ImageUrl"
    }
}

struct DisplayInfo: Codable {
    var eur: CurrencyDisplayInfo

    enum CodingKeys: String, CodingKey {
        case eur = "EUR"
    }
}

struct CurrencyDisplayInfo: Codable {
    var price: String
    var volume24Hour: String

    enum CodingKeys: String, CodingKey {
        case price = "PRICE"
        case volume24Hour = "VOLUME24HOUR"
    }
}
