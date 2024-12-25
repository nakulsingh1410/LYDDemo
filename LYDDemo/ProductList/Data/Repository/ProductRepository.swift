//
//  ProductRepository.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 24/12/24.
//

final class ProductRepository: ProductRepositoryProtocol {
    
    private let networkService: NetworkServiceProtocol
    private let productListApi = Constant.API.productListApi
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func getProducts(callback: @escaping (Result<[Product], any Error>) -> Void) {
        networkService.fetchData(url: productListApi) { result in
            callback(result)
        }
    }
}
