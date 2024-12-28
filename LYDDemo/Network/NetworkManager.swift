//
//  NetworkService.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 24/12/24.
//

import Foundation

final class NetworkManager: NetworkManagerProtocol {
    
    private let session: URLSession
    private let requestGenerator: URLRequestGeneratorProtocol
    
    init(session: URLSession = .shared) {
        self.session = session
        self.requestGenerator = URLRequestGenerator()
    }
    
    func request<T>(request: NetworkRequestProtocol, callback: @escaping (Result<T, any Error>) -> Void) where T : Decodable {
        
        guard let urlRequest = try? requestGenerator.createURLRequest(request: request) else {
            callback(.failure(NetworkError.invalidRequest))
            return
        }
        
        session.dataTask(with: urlRequest) {data, response, error in
            if error != nil {
                callback(.failure(NetworkError.badRequest))
                return
            }
            
            guard let urlResponse = response as? HTTPURLResponse else {
                callback(.failure(NetworkError.noResponse))
                return
            }
            
            if urlResponse.statusCode != 200 {
                callback(.failure(NetworkError.failed))
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
