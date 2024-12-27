//
//  NetworkServiceProtocol.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 24/12/24.
//

protocol NetworkServiceProtocol {
    func request<T: Decodable>(request: NetworkRequestProtocol, callback: @escaping (Result<T, Error>) -> Void)
}
