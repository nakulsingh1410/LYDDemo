//
//  MockProductRepository.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 24/12/24.
//

import XCTest
@testable import LYDDemo

class MockProductRepository: ProductRepositoryProtocol {
    
    var products: [ProductDomainDTO] = []
    var error: Error?
    
    func getProducts(callback: @escaping (Result<[ProductDomainDTO], any Error>) -> Void) {
        if let error {
            callback(.failure(error))
            return
        }
        
        if !products.isEmpty {
            callback(.success(products))
            return
        }
    }
    
}
