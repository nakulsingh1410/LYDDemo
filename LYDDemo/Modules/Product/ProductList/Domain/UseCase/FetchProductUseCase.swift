//
//  ProductUseCaseProtocol.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 24/12/24.
//

protocol FetchProductUseCase {
    func fetchProducts(callback: @escaping (Result<[Product], Error>) -> Void)
}
