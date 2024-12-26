//
//  ErrorView.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 26/12/24.
//
import SwiftUI

struct ErrorView: View {
    let errorMessage: String
    var body: some View {
        Text(errorMessage)
            .foregroundColor(.red)
            .accessibilityLabel(Constant.ProductListConstant.errorLabel)
            .accessibilityValue(errorMessage)
    }
}
