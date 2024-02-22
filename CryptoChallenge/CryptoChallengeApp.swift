//
//  CryptoChallengeApp.swift
//  CryptoChallenge
//
//  Created by Carlos Butron on 18/2/24.
//

import SwiftUI

@main
struct CryptoChallengeApp: App {    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            CryptoListFactory.create(managedObjectContext: persistenceController.container.viewContext)
        }
    }
}
