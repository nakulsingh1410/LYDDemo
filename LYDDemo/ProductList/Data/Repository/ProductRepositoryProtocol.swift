//
//  ProductRepositoryProtocol.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 24/12/24.
//

protocol ProductRepositoryProtocol {
    func getProducts(callback: @escaping (Result<[Product], Error>) -> Void)
}
