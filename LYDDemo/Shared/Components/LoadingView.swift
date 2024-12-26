//
//  Untitled.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 26/12/24.
//
import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView(Constant.ProductListConstant.loadingMessage)
            .accessibilityLabel(Constant.ProductListConstant.loadingMessage)
    }
}
