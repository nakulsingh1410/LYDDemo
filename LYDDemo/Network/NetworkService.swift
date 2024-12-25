//
//  NetworkService.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 24/12/24.
//

import Foundation

class NetworkService: NetworkServiceProtocol {
    
    func fetchData<T>(url: String, callback: @escaping (Result<T, any Error>) -> Void) where T : Decodable {
        
        guard let url = URL(string: url) else {
            callback(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            if let error {
                callback(.failure(NetworkError.custom(message: error.localizedDescription)))
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, !(200..<300).contains(httpResponse.statusCode) {
                callback(.failure(NetworkError.custom(message: "\(httpResponse.statusCode)")))
                return
            }
            guard let data else {
                callback(.failure(NetworkError.noData))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                callback(.success(decodedData))
            } catch {
                callback(.failure(NetworkError.invalidData))
            }
            
        }.resume()
    }
}
