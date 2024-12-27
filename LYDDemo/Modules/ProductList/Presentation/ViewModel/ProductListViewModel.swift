//
//  ProductListViewModel.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 24/12/24.
//

import Foundation

final class ProductListViewModel: ObservableObject {
    
    @Published private(set) var products: [Product] = []
    @Published private(set) var errorMesage: String?
    @Published private(set) var isLoading = false
    
    private let useCase: FetchProductUseCase
    
    init(useCase: FetchProductUseCase) {
        self.useCase = useCase
    }
    
    func fetchProducts() {
        isLoading = true
        useCase.fetchProducts {[weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let products):
                    self?.products = products
                case .failure(let error):
                    self?.errorMesage = error.localizedDescription
                }
            }
        }
    }
}
