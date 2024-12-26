//
//  ProductDetailView.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 26/12/24.
//

import SwiftUI

struct ProductDetailView: View {
    private var viewModel: ProductDetailViewModel
    
    init(viewModel: ProductDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(viewModel.product.title ?? "")
                .font(.title)
                .bold()
                .accessibilityLabel(Constant.ProductDetailConstant.productNameLabel)
            
            Text("$\(viewModel.product.price ?? 0, specifier: "%.2f")")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .accessibilityLabel(Constant.ProductDetailConstant.productPriceLabel)
            
            Text(viewModel.product.description ?? "")
                .font(.body)
                .multilineTextAlignment(.leading)
                .accessibilityLabel(Constant.ProductDetailConstant.productDescriptionLabel)
            
            Spacer()
        }
        .padding()
        .accessibilityLabel(Constant.ProductDetailConstant.productDetailScreenLabel)
    }
}

