//
//  APIConstants.swift
//  CryptoChallenge
//
//  Created by Carlos on 22/2/24.
//

import Foundation

class APIConstants {
    static let baseUrl = "https://min-api.cryptocompare.com/"
    static let cryptoOriginWeb = "https://www.cryptocompare.com"
    
    struct Endpoints {
        static let topTotalVolumeFull = "data/top/totalvolfull"
    }
    
    struct Parameters {
        static let limit = "limit"
        static let page = "page"
        static let tsym = "tsym"
    }
    
    struct ParameterValues {
        static let limitValue = "20"
        static let tsymValue = "EUR"
    }
    
    static func queryParameters(forPage page: Int) -> [String: Any] {
        return [
            Parameters.limit: ParameterValues.limitValue,
            Parameters.page: "\(page)",
            Parameters.tsym: ParameterValues.tsymValue
        ]
    }
}
