//
//  GlobalCryptoListFactory.swift
//  CryptoChallenge
//
//  Created by Carlos Butron on 18/2/24.
//

import Foundation
import CoreData

class CryptoListFactory {
    static func create(managedObjectContext: NSManagedObjectContext) -> CryptoListView {
        return CryptoListView(viewModel: createViewModel(managedObjectContext: managedObjectContext))
    }
    
    private static func createViewModel(managedObjectContext: NSManagedObjectContext) -> CryptoListViewModel {
        return CryptoListViewModel(
            getCryptoList: createUseCase(managedObjectContext: managedObjectContext),
            errorMapper: CryptocurrencyPresentableErrorMapper()
        )
    }
    
    private static func createUseCase(managedObjectContext: NSManagedObjectContext) -> GetCryptoListType {
        return GetCryptoList(repository: createRepository(managedObjectContext: managedObjectContext))
    }
    
    private static func createRepository(managedObjectContext: NSManagedObjectContext) -> CryptoListRepositoryType {
        let apiDataSource = createDataSource()
        let localDataSource = createLocalDataSource(managedObjectContext: managedObjectContext)
        return CryptoCurrencyRepository(
            apiDataSource: apiDataSource,
            localDataSource: localDataSource,
            errorMapper: CryptoCurrencyDomainErrorMapper()
        )
    }
    
    private static func createDataSource() -> APICryptoDataSource {
        let httpClient = URLSessionHTTPCLient(requestMaker: URLSessionRequestMaker(),
                                              errorResolver: URLSessionErrorResolver())
        return APICryptoDataSource(httpCLient: httpClient)
    }
    
    private static func createLocalDataSource(managedObjectContext: NSManagedObjectContext) -> LocalCryptoDataSource {
        return LocalCryptoDataSource(managedContext: managedObjectContext)
    }
}
