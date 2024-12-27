//
//  ProductRepository.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 24/12/24.
//
import Foundation

final class ProductRepository: ProductRepositoryProtocol {
    
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func getProducts(callback: @escaping (Result<[Product], Error>) -> Void) {
        let request = NetworkRequest(path: Constant.API.productsPath, method: .get)
        networkService.request(request: request) { result in
            callback(result)
        }
    }
}
