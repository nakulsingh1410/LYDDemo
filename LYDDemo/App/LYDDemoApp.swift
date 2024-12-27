//
//  LYDDemoApp.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 24/12/24.
//

import SwiftUI

@main
struct LYDDemoApp: App {
    
    @StateObject private var navigationManager = NavigationManager()
    private let repository = ProductRepository(networkService: NetworkService())
    private let useCase: FetchProductUseCase
    private let viewModel: ProductListViewModel
    
    init () {
        useCase = FetchProductUseCaseImpl(repository: repository)
        viewModel = ProductListViewModel(useCase: useCase)
    }
    
    var body: some Scene {
        WindowGroup {
            ProductListView(viewModel: viewModel)
                .environmentObject(navigationManager)
        }
    }
}
