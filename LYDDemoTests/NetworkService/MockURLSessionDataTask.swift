//
//  MockURLSessionDataTask.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 27/12/24.
//
import Foundation

final class MockURLSessionDataTask: URLSessionDataTask {
    private let closure: () -> Void

    init(closure: @escaping () -> Void) {
        self.closure = closure
    }

    override func resume() {
        closure()
    }
}
