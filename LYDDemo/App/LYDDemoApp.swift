//
//  LYDDemoApp.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 24/12/24.
//

import SwiftUI

@main
struct LYDDemoApp: App {
    var body: some Scene {
        WindowGroup {
            let repository = ProductRepository(networkService: NetworkService())
            let useCase = FetchProductUseCase(repository: repository)
            let viewModel = ProductListViewModel(useCase: useCase)
            ProductListView(viewModel: viewModel)
        }
    }
}
