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
            Text(viewModel.product.title)
                .font(.title)
                .bold()
                .accessibilityLabel(Constant.ProductDetail.nameLabel)
            
            Text("$\(viewModel.product.price, specifier: "%.2f")")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .accessibilityLabel(Constant.ProductDetail.priceLabel)
            
            Text(viewModel.product.description)
                .font(.body)
                .multilineTextAlignment(.leading)
                .accessibilityLabel(Constant.ProductDetail.descriptionLabel)
            
            Spacer()
        }
        .padding()
        .accessibilityLabel(Constant.ProductDetail.screenLabel)
    }
}

