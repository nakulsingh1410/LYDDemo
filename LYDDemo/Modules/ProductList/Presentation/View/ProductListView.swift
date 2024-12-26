//
//  ProductListView.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 24/12/24.
//

import SwiftUI

struct ProductListView: View {
    @EnvironmentObject private var navigationManager: NavigationManager
    @ObservedObject private var viewModel: ProductListViewModel
    
    init(viewModel: ProductListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        NavigationStack(path: $navigationManager.navigationPath) {
            content
                .navigationTitle(Constant.ProductListConstant.title)
                .accessibilityLabel(Constant.ProductListConstant.productListScreenLabel)
                .onAppear() {
                    viewModel.fetchProducts()
                }
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .productDetail(let product):
                        ProductDetailView(viewModel: ProductDetailViewModel(product: product))
                    default:
                        EmptyView()
                    }
                }
        }
    }
    
    @ViewBuilder
    private var content: some View {
        if viewModel.isLoading {
            LoadingView()
        } else if let error = viewModel.errorMesage {
            ErrorView(errorMessage: error)
        } else {
            ProductList(products: viewModel.products)
        }
    }
}

private struct ProductList: View {
    @EnvironmentObject private var navigationManager: NavigationManager
    let products: [Product]
    
    var body: some View {
        List(products, id: \.self._id) { product in
            Button(action: {
                navigationManager.navigateTo(AppRoute.productDetail(product: product))
            }) {
                ProductRow(product: product)
            }
            .buttonStyle(.plain)
        }
        .accessibilityLabel(Constant.ProductListConstant.productListLabel)
    }
}


private struct ProductRow: View {
    let product: Product
    var body: some View {
        VStack(alignment: .leading) {
            Text(product.title ?? "")
                .font(.headline)
                .accessibilityLabel(Constant.ProductListConstant.productNameLabel)
                .accessibilityValue(product.title ?? "")
            Text("$\(product.price ?? 0, specifier: "%.2f")")
                .font(.subheadline)
                .accessibilityLabel(Constant.ProductListConstant.productPriceLabel)
                .accessibilityValue("$\(product.price ?? 0, specifier: "%.2f")")
        }
        .accessibilityElement(children: .combine)
    }
}
