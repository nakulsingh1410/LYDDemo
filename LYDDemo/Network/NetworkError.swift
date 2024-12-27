//
//  NetworkError.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 24/12/24.
//

enum NetworkError: Error {
    case invalidURL
    case invalidRequest
    case badRequest
    case noResponse
    case failed
    case invalidData
    case noData
    case custom(message: String)
    
    var description: String {
        switch self {
        case .badRequest: return "Bad Request."
        case .invalidURL: return "The URL provided is invalid."
        case .invalidRequest: return "The request is invalid."
        case .noResponse: return "No response from the server."
        case .failed: return "An error occurred while performing the request."
        case .invalidData: return "Unable to decode data"
        case .noData: return "No data was returned from the server."
        case .custom(let message): return message
        }
    }
}
