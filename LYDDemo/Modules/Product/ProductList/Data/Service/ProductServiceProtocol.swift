//
//  ProductService.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 28/12/24.
//

protocol ProductServiceProtocol {
    func getProductsFromNetwork(completion: @escaping (Result<[ProductResponse], Error>)-> Void)
}
