//
//  LocalCryptoDataSource.swift
//  CryptoChallenge
//
//  Created by Carlos Butron on 20/2/24.
//

import Foundation
import CoreData

class LocalCryptoDataSource: LocalDataSourceType {
    private var managedContext: NSManagedObjectContext

    init(managedContext: NSManagedObjectContext) {
        self.managedContext = managedContext
    }
    
    func getCryptoList(page: Int) async -> Result<(cryptoList: [CryptoCurrency], paginationInfo: CryptoCurrencyPaginationInfo), Error> {
        let fetchRequest: NSFetchRequest<CryptoCurrencyEntity> = CryptoCurrencyEntity.fetchRequest()

        do {
            let results = try managedContext.fetch(fetchRequest)
            let cryptoList = results.map { cryptoEntity -> CryptoCurrency in
                return CryptoCurrency(
                    id: cryptoEntity.id ?? "",
                    name: cryptoEntity.name ?? "",
                    logoImage: cryptoEntity.logoImage ?? "",
                    symbol: cryptoEntity.symbol ?? "",
                    value: cryptoEntity.value ?? "",
                    volume24h: cryptoEntity.volume24h ?? ""
                )
            }
            
            let mockPaginationInfo = CryptoCurrencyPaginationInfo(count: 0, pagination: 1)
            
            return .success((cryptoList: cryptoList, paginationInfo: mockPaginationInfo))
        } catch {
            return .failure(error)
        }
    }
    
    func saveCryptoList(_ cryptoList: [CryptoCurrency]) async {
        for crypto in cryptoList {
            let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "CryptoCurrencyEntity")
            fetchRequest.predicate = NSPredicate(format: "id == %@", crypto.id)
            fetchRequest.fetchLimit = 1

            do {
                let results = try managedContext.fetch(fetchRequest)
                let cryptoEntity: NSManagedObject
                
                if let existingEntity = results.first as? NSManagedObject {
                    cryptoEntity = existingEntity
                } else {
                    let entity = NSEntityDescription.entity(forEntityName: "CryptoCurrencyEntity", in: managedContext)!
                    cryptoEntity = NSManagedObject(entity: entity, insertInto: managedContext)
                }
                
                cryptoEntity.setValue(crypto.id, forKeyPath: "id")
                cryptoEntity.setValue(crypto.name, forKey: "name")
                cryptoEntity.setValue(crypto.logoImage, forKey: "logoImage")
                cryptoEntity.setValue(crypto.symbol, forKey: "symbol")
                cryptoEntity.setValue(crypto.value, forKey: "value")
                cryptoEntity.setValue(crypto.volume24h, forKey: "volume24h")
                
                try managedContext.save()
            } catch let error as NSError {
                print("Could not fetch or save. \(error), \(error.userInfo)")
            }
        }
    }
}
