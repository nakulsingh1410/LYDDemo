//
//  ProductListView.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 24/12/24.
//

import SwiftUI

struct ProductListView: View {
    @ObservedObject private var viewModel: ProductListViewModel
    
    init(viewModel: ProductListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        NavigationView {
            Group {
                if viewModel.isLoading {
                    LoadingView()
                } else if let error = viewModel.errorMesage {
                    ErrorView(errorMessage: error)
                } else {
                    ProductList(products: viewModel.products)
                }
            }
            .navigationTitle(Constant.ProductListConstant.title)
            .accessibilityLabel(Constant.ProductListConstant.productListScreenLabel)
            .onAppear() {
                viewModel.fetchProducts()
            }
        }
    }
}


private struct LoadingView: View {
    var body: some View {
        ProgressView(Constant.ProductListConstant.loadingMessage)
            .accessibilityLabel(Constant.ProductListConstant.loadingMessage)
    }
}


private struct ErrorView: View {
    let errorMessage: String
    var body: some View {
        Text(errorMessage)
            .foregroundColor(.red)
            .accessibilityLabel(Constant.ProductListConstant.errorLabel)
            .accessibilityValue(errorMessage)
    }
}

private struct ProductList: View {
    let products: [Product]
    
    var body: some View {
        List(products, id: \.self._id) { product in
            ProductRow(product: product)
        }
        .accessibilityLabel(Constant.ProductListConstant.productListLabel)
        .accessibilityHint(Constant.ProductListConstant.productListLabel)
    }
}


private struct ProductRow: View {
    let product: Product
    var body: some View {
        VStack(alignment: .leading) {
            Text(product.title)
                .font(.headline)
                .accessibilityLabel(Constant.ProductListConstant.productNameLabel)
                .accessibilityValue(product.title)
            Text("$\(product.price, specifier: "%.2f")")
                .font(.subheadline)
                .accessibilityLabel(Constant.ProductListConstant.productPriceLabel)
                .accessibilityValue("$\(product.price, specifier: "%.2f")")
        }
        .accessibilityElement(children: .combine)
    }
}


#Preview {
    ProductListView(viewModel: ProductListViewModel(useCase: FetchProductUseCase(repository: ProductRepository(networkService: NetworkService()))))
}
