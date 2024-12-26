//
//  ProductUseCaseProtocol.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 24/12/24.
//

protocol FetchProductUseCaseProtocol {
    func fetchProduct(callback: @escaping (Result<[Product], Error>) -> Void)
}
