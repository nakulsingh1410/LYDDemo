//
//  ProductServiceProtocol.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 28/12/24.
//

final class ProductService: ProductServiceProtocol {
    
    private let networkService: NetworkManagerProtocol
    
    init(networkService: NetworkManagerProtocol) {
        self.networkService = networkService
    }
    
    func getProductsFromNetwork(completion: @escaping (Result<[ProductResponse], Error>) -> Void) {
        let request = NetworkRequest(path: Constant.API.productsPath, method: .get)
        networkService.request(request: request) { result in
            completion(result)
        }
    }
}
