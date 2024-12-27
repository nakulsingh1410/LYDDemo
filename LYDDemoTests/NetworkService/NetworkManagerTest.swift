//
//  NetworkServiceTest.swift
//  LYDDemoTests
//
//  Created by Singh, Nakul on 25/12/24.
//

import XCTest
@testable import LYDDemo

final class NetworkManagerTest: XCTestCase {
    
    var networkManager: NetworkManager!
    var mockUrlSession: MockURLSession!
    
    var response: HTTPURLResponse {
        HTTPURLResponse(url: URL(string: Constant.API.productsPath)!, statusCode: 200, httpVersion: nil, headerFields: nil)!
    }
    let urlRequest = NetworkRequest(path: Constant.API.productsPath, method: .get)
    
    override func setUp() {
        super.setUp()
        mockUrlSession = MockURLSession()
        networkManager = NetworkManager(session: mockUrlSession)
    }
    
    override func tearDown() {
        mockUrlSession = nil
        networkManager = nil
        super.tearDown()
    }

    
    private func mockSuccessfulResponse(with data: Data, response: HTTPURLResponse) {
        mockUrlSession.data = data
        mockUrlSession.urlResponse = response
        mockUrlSession.error = nil
    }
    
    func testRequestSuccess() {
        mockSuccessfulResponse(with: MockData.productData, response: response)
        
        let expectation = self.expectation(description: "success response")
        
        networkManager.request(request: urlRequest) { (result: Result<[Product], Error>) in
            switch result {
            case .success(let products):
                XCTAssertEqual(products.first?._id, 1)
                XCTAssertEqual(products.first?.title, "Long sleeve Jacket")
                expectation.fulfill()
            case .failure:
                XCTFail("Expected success, but got failure.")
            }
        }
        wait(for: [expectation], timeout: 3.0)
    }
    
    private func checkAssertFailure(
        request: NetworkRequest,
        expectedError: NetworkError,
        data: Data? = nil,
        urlResponse: URLResponse? = nil,
        error: Error? = nil,
        description: String
    ) {
        let expectation = self.expectation(description: description)
        mockUrlSession.data = data
        mockUrlSession.urlResponse = urlResponse
        mockUrlSession.error = error
        
        networkManager.request(request: request) { (result: Result<Product, Error>) in
            switch result {
            case .success:
                XCTFail("Expected failure, but got success.")
            case .failure(let receivedError):
                XCTAssertEqual(receivedError.localizedDescription, expectedError.localizedDescription)
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testRequestFailure() {
        checkAssertFailure(
            request: urlRequest,
            expectedError: .badRequest,
            error: NetworkError.badRequest,
            description: "Bad Request Failure"
        )
    }
    
    func testInvalidRequestFailure() {
        let invalidUrlRequest = NetworkRequest(path: "#.%.#", method: .get)
        checkAssertFailure(
            request: invalidUrlRequest,
            expectedError: .invalidRequest,
            description: "Invalid Request Failure"
        )
    }
    
    func testParseDataFailure() {
        checkAssertFailure(
            request: urlRequest,
            expectedError: .invalidData,
            data: Data(),
            urlResponse: response,
            description: "Parse Data Failure"
        )
    }
    
    func testNoResponseFailure() {
        checkAssertFailure(
            request: urlRequest,
            expectedError: .noResponse,
            description: "No Response Failure"
        )
    }
}

