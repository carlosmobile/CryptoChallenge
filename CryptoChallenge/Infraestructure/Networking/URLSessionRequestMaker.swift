//
//  URLSessionRequestMaker.swift
//  CryptoChallenge
//
//  Created by Carlos Butron on 18/2/24.
//

import Foundation

class URLSessionRequestMaker {
    func url(endpoint: Endpoint, baseUrl: String) -> URL? {
        var urlComponents = URLComponents(string: baseUrl + endpoint.path)
        let urlQueryParametrs = endpoint.queryParameters.map { URLQueryItem(name: $0.key, value: "\($0.value)")}
        urlComponents?.queryItems = urlQueryParametrs
        
        return urlComponents?.url
    }
}
