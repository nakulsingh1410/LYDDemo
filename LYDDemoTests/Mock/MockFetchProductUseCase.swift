//
//  MockFetchProductUseCase.swift
//  LYDDemoTests
//
//  Created by Singh, Nakul on 24/12/24.
//

import XCTest
@testable import LYDDemo

class MockFetchProductUseCase: FetchProductUseCase {
    
    var products: [Product] = []
    var error: Error? = nil
    
    func fetchProducts(callback: @escaping (Result<[Product], any Error>) -> Void) {
        if let error {
            callback(.failure(error))
            return
        }
        if !products.isEmpty {
            callback(.success(products))
        }
    }
}
