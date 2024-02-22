//
//  APICryptoDataSource.swift
//  CryptoChallenge
//
//  Created by Carlos Butron on 18/2/24.
//

import Foundation

class APICryptoDataSource {
    private let httpCLient: HTTPCLient
    
    init(httpCLient: HTTPCLient) {
        self.httpCLient = httpCLient
    }
}

extension APICryptoDataSource: ApiDataSourceType {
    func getCryptoList(page: Int) async -> Result<(cryptoList: [CryptoCurrency], paginationInfo: CryptoCurrencyPaginationInfo), HTTPClientError> {
                
        let queryParameters: [String : Any] = [
            "limit" : "20",
            "page" : page,
            "tsym" : "EUR"
        ]
        
        let endpoint = Endpoint(path: "data/top/totalvolfull",
                                queryParameters: queryParameters,
                                method: .get)

        let result = await httpCLient.makeRequest(endpoint: endpoint, baseUrl: "https://min-api.cryptocompare.com/")
        
        guard case .success(let data) = result else {
            return .failure(handleError(error: result.failureValue as? HTTPClientError))
        }
        
        do {
            if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                print(jsonObject)
            }
        } catch {
            print("Error al serializar JSON: \(error)")
        }
        
        do {
            let apiResponse = try JSONDecoder().decode(CryptoCurrencyGlobalInfoDTO.self, from: data)
            let cryptoCurrencyList = apiResponse.data.compactMap { data -> CryptoCurrency? in
                guard let eurDisplayInfo = data.display?.eur else { return nil }
                return CryptoCurrency(
                    id: data.coinInfo.id,
                    name: data.coinInfo.fullName,
                    logoImage: "https://www.cryptocompare.com\(data.coinInfo.imageUrl)",
                    symbol: data.coinInfo.name,
                    value: eurDisplayInfo.price,
                    volume24h: eurDisplayInfo.volume24Hour
                )
            }
            
            let paginationCount = CryptoCurrencyPaginationInfo(count: apiResponse.metadata.count, pagination: 20)

            return .success((cryptoList: cryptoCurrencyList, paginationInfo: paginationCount))
        } catch {
            print("Error al decodificar: \(error)")
            return .failure(.parsingError)
        }
        

    }
    
    private func handleError(error: HTTPClientError?) -> HTTPClientError {
        guard let error = error else {
            return .generic
        }
        
        return error
    }
}
