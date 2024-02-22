//
//  HeaderView.swift
//  CryptoChallenge
//
//  Created by Carlos Butron on 21/2/24.
//

import SwiftUI

struct CryptoHeaderView: View {
    let crypto: CryptoCurrency

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: crypto.logoImage)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 100)
            .cornerRadius(50)
            
            Text(crypto.name)
                .font(.title)
            
            Text(crypto.symbol)
                .font(.title2)
            
            Text("\(crypto.value)")
                .font(.headline)
            
            Text("Volume over 24h: \(crypto.volume24h)")
                .font(.headline)
        }
    }
}
