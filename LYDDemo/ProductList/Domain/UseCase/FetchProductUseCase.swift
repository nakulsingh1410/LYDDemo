//
//  ProductUseCase.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 24/12/24.
//

final class FetchProductUseCase: FetchProductUseCaseProtocol {
    
    private let repository: ProductRepositoryProtocol
    
    init(repository: ProductRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchProduct(callback: @escaping (Result<[Product], Error>) -> Void) {
        repository.getProducts { result in
            callback(result)
        }
    }
}
