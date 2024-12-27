//
//  NetworkRequest.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 27/12/24.
//
import Foundation

enum HTTPMethod: String {
    case get    = "GET"
    case post   = "POST"
    case put    = "PUT"
    case delete = "DELETE"
}

protocol NetworkRequestProtocol {
    var path: String { get set }
    var method: HTTPMethod { get set }
    var headerParameters: [String: String] { get set }
    var queryItems: [String: Any] { get set }
    var bodyparameters: [String: Any] { get set }
}

class NetworkRequest : NetworkRequestProtocol {
    
    var path: String
    var method: HTTPMethod
    var headerParameters: [String : String]
    var queryItems: [String : Any]
    var bodyparameters: [String : Any]

    
    init(path: String,
         method: HTTPMethod,
         headerParameters: [String : String] = [:],
         queryItems: [String : Any] = [:],
         bodyparameters: [String : Any] = [:]) {
        self.path = path
        self.method = method
        self.headerParameters = headerParameters
        self.queryItems = queryItems
        self.bodyparameters = bodyparameters
    }
}
