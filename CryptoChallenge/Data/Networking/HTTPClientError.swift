//
//  HTTPClientError.swift
//  CryptoChallenge
//
//  Created by Carlos Butron on 18/2/24.
//

import Foundation

enum HTTPClientError: Error {
    case clientError
    case serverError
    case parsingError
    case tooManyRequests
    case badURL
    case responseError
    case generic
}
