//
//  URLRequestGenerator.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 27/12/24.
//
import Foundation

protocol URLRequestGeneratorProtocol {
    func createURLRequest(request: NetworkRequestProtocol) throws -> URLRequest
}

class URLRequestGenerator: URLRequestGeneratorProtocol {
    func createURLRequest(request: NetworkRequestProtocol) throws -> URLRequest {
        do {
            let url = try getURL(endpoint: request)
            var urlRequest = URLRequest(url: url,cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
            urlRequest.httpMethod = request.method.rawValue
            if !request.bodyparameters.isEmpty {
                let bodyData = try? JSONSerialization.data(withJSONObject: request.bodyparameters, options: [.prettyPrinted])
                urlRequest.httpBody = bodyData
            }
            request.headerParameters.forEach({key, value in
                urlRequest.setValue(value, forHTTPHeaderField: key)
            })
            return urlRequest
            
        } catch {
            throw error
        }
    }
    
    private func getURL(endpoint: NetworkRequestProtocol) throws -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = Constant.API.host
        components.path = endpoint.path
        components.queryItems = endpoint.queryItems.map{
            URLQueryItem(name: $0, value: "\($1)")
        }
        guard  let url = components.url else {
            throw NetworkError.invalidURL
        }
        return url
    }
}
