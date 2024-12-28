//
//  MockProductServiceTests.swift
//  LYDDemoTests
//
//  Created by Singh, Nakul on 28/12/24.
//

@testable import LYDDemo

final class MockProductService: ProductServiceProtocol {
    var response: [ProductResponse]?
    var error: Error?
    
    func getProductsFromNetwork(completion: @escaping (Result<[ProductResponse], any Error>) -> Void) {
        if let error {
            completion(.failure(error))
        }
        if let response  {
            completion(.success(response))
        }
    }
}
