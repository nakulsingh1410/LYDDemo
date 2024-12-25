//
//  NetworkError.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 24/12/24.
//

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case noData
    case invalidJSON
    case custom(message: String)
}
