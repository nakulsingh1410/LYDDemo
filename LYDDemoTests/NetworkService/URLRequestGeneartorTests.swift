//
//  URLRequestGeneartorTests.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 27/12/24.
//
import XCTest
@testable import LYDDemo

class URLRequestGeneartorTests: XCTestCase {
    var requestGenerator: URLRequestGeneratorProtocol!
    
    override func setUp() {
        super.setUp()
        requestGenerator = URLRequestGenerator()
    }
    
    override func tearDown() {
        requestGenerator = nil
        super .tearDown()
    }
    
    func testURLRequest() {
        let urlRequest = NetworkRequest(path: Constant.API.productsPath,
                                        method: .get,
                                        headerParameters: ["Content-Type" : "application/json"])
        do {
            let urlRequest = try requestGenerator.createURLRequest(request: urlRequest)
            XCTAssertEqual(urlRequest.url?.host, Constant.API.host)
            XCTAssertEqual(urlRequest.url?.scheme, "https")
            XCTAssertEqual(urlRequest.url?.path, Constant.API.productsPath)
            XCTAssertEqual(urlRequest.httpMethod, "GET")
            XCTAssertEqual(urlRequest.allHTTPHeaderFields?["Content-Type"], "application/json")
            XCTAssertNil(urlRequest.httpBody)
        } catch {
            XCTFail()
        }
    }
}
