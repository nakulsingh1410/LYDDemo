//
//  MockURLSession.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 27/12/24.
//
import Foundation

class MockURLSession: URLSession, @unchecked Sendable {
    typealias completionHandler = (Data?, URLResponse?, Error?) -> Void
    var data: Data?
    var urlResponse: URLResponse?
    var error: Error?
    
    init(configuration: URLSessionConfiguration = .default) {
           super.init()
    }
    
    override func dataTask(with request: URLRequest,
                           completionHandler: @escaping completionHandler) -> URLSessionDataTask {
        return MockURLSessionDataTask {
            completionHandler(self.data, self.urlResponse, self.error)
        }
        
    }
}
