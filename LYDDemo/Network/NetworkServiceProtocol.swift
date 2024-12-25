//
//  NetworkServiceProtocol.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 24/12/24.
//

protocol NetworkServiceProtocol {
    func fetchData<T: Decodable>(url: String, callback: @escaping (Result<T, Error>) -> Void)
}
