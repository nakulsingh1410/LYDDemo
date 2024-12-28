//
//  ProductRepository.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 24/12/24.
//
import Foundation

final class ProductRepository: ProductRepositoryProtocol {
    
    private let productService: ProductServiceProtocol
    
    init(productService: ProductServiceProtocol) {
        self.productService = productService
    }
    
    func getProducts(callback: @escaping (Result<[ProductDomainDTO], Error>) -> Void) {
        productService.getProductsFromNetwork { result in
            switch result {
            case .success(let products):
                callback(.success(products.map {$0.toDomain()}))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
}
