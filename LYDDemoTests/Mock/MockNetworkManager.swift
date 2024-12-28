//
//  MockNetworkService.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 24/12/24.
//

@testable import LYDDemo
import Foundation

class MockNetworkManager: NetworkManagerProtocol {
    var data: Data?
    var error: Error?
    
    func request<T>(request: NetworkRequestProtocol, callback: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) { [weak self] in
            if let data = self?.data {
                let result  = try! JSONDecoder().decode(T.self, from: data)
                callback(.success(result))
            } else {
                callback(.failure(NetworkError.noData))
            }
        }
    }
}
