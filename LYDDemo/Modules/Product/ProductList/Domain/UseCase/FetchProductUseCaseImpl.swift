//
//  ProductUseCase.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 24/12/24.
//

final class FetchProductUseCaseImpl: FetchProductUseCase {
    
    private let productRepository: ProductRepositoryProtocol
    
    init(repository: ProductRepositoryProtocol) {
        self.productRepository = repository
    }
    
    func fetchProducts(callback: @escaping (Result<[Product], Error>) -> Void) {
        productRepository.getProducts { result in
            switch result {
            case .success( let product):
                callback(.success(product.map{$0.toPresentation()}))
            case .failure(_):
                callback(.failure(NetworkError.failed))
            }
        }
    }
}
