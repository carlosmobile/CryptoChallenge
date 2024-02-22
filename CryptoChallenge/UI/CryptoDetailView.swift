//
//  CryptoDetailView.swift
//  CryptoChallenge
//
//  Created by Carlos Butron on 19/2/24.
//

import SwiftUI

struct CryptoDetailView: View {
    @ObservedObject var viewModel: CryptoDetailViewModel
    @FocusState private var isInputActive: Bool
    
    var body: some View {
        VStack {
            CryptoHeaderView(crypto: viewModel.crypto)
            
            CalculateCurrencyView(
                userInputString: $viewModel.userInputString,
                computedValue: $viewModel.computedValue,
                symbol: viewModel.crypto.symbol,
                computeAction: {
                    viewModel.computeValue()
                }
            )
            Spacer()
        }
        .padding()
        .navigationTitle("Crypto Details")
    }
}
