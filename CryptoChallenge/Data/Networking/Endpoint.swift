//
//  Endpoint.swift
//  CryptoChallenge
//
//  Created by Carlos Butron on 18/2/24.
//

import Foundation

struct Endpoint {
    let path: String
    let queryParameters: [String : Any]
    let method: HTTPMethod
}
