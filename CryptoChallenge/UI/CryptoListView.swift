//
//  CryptoListView.swift
//  CryptoChallenge
//
//  Created by Carlos Butron on 18/2/24.
//

import SwiftUI

struct CryptoListView: View {
    @ObservedObject private var viewModel: CryptoListViewModel
    
    private let scrollMargin: CGFloat = 10
    private let spaceBetweenRows: CGFloat = 25
    
    init(viewModel: CryptoListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    LazyVStack(spacing: spaceBetweenRows) {
                        ForEach(viewModel.cryptos, id: \.id) { crypto in
                            NavigationLink(destination: CryptoDetailFactory.create(with: crypto)) {
                                CryptoRowView(crypto: crypto)
                                    .padding(.horizontal)
                                    .contentShape(Rectangle())
                            }
                            .buttonStyle(PlainButtonStyle())
                            .onAppear {
                                if viewModel.shouldLoadMoreData(currentItem: crypto) {
                                    viewModel.loadMoreData()
                                }
                            }
                        }
                    }
                }
                .accessibilityIdentifier("MyCryptoList")
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Cryptocurrencies")
                .padding(.top, scrollMargin)
                .padding(.bottom, scrollMargin)
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(2)
                }
                if viewModel.showErrorMessage != nil {
                    Text(viewModel.showErrorMessage!)
                }
            }
            .onAppear {
                viewModel.onAppear()
            }
        }
    }
}
