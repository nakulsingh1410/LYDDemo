//
//  Untitled.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 26/12/24.
//
import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView(Constant.ProductList.loadingMessage)
            .accessibilityLabel(Constant.ProductList.loadingMessage)
    }
}
