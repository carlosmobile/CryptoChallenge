//
//  CryptoRowView.swift
//  CryptoChallenge
//
//  Created by Carlos Butron on 21/2/24.
//

import SwiftUI

struct CryptoRowView: View {
    var crypto: CryptoCurrency
    let imageSize: CGFloat = 50
    let standardMargin: CGFloat = 8

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: crypto.logoImage)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: imageSize, height: imageSize)
            .cornerRadius(standardMargin)
            .padding(.trailing, standardMargin)
            
            VStack(alignment: .leading, spacing: standardMargin) {
                Text(crypto.name)
                    .font(.headline)
                Text(crypto.symbol)
                    .font(.subheadline)
            }
            
            Spacer()
            
            Text("\(crypto.value)")
                .font(.body)
                .fontWeight(.bold)
                .padding(.trailing)
        }
    }
}
