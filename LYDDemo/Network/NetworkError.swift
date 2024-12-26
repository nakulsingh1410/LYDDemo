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
    
    var descrition: String {
        switch self {
        case .invalidURL: return "The URL provided is invalid."
        case .invalidResponse: return "The response from the server is invalid."
        case .invalidData: return "The data received is corrupted or invalid."
        case .noData: return "No data was returned from the server."
        case .invalidJSON: return "The response data could not be parsed as JSON."
        case .custom(let message): return message
        }
    }
}
