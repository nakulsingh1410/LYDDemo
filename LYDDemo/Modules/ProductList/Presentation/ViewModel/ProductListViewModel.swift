//
//  ProductListViewModel.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 24/12/24.
//

import Foundation

final class ProductListViewModel: ObservableObject {
    
    @Published private(set) var products: [Product] = []
    @Published private(set) var errorMesage: String? = nil
    @Published private(set) var isLoading = false
    
    private let useCase: FetchProductUseCaseProtocol
    
    init(useCase: FetchProductUseCaseProtocol) {
        self.useCase = useCase
    }
    
    func fetchProducts() {
        isLoading = true
        useCase.fetchProduct {[weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let products):
//                    debugPrint("Products: \(products)")
                    self?.products = products
                case .failure(let error):
//                    debugPrint("Error: \(error)")
                    self?.errorMesage = error.localizedDescription
                }
            }
        }
    }
}
