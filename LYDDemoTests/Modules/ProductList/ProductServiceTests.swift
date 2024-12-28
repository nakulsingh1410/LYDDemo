//
//  ProductServiceTests.swift
//  LYDDemoTests
//
//  Created by Singh, Nakul on 28/12/24.
//

import XCTest
@testable import LYDDemo

final class ProductServiceTests: XCTestCase {
    
    var productService: ProductServiceProtocol!
    var mockNetworkManager: MockNetworkManager!
    
    override func setUp() {
        super.setUp()
        mockNetworkManager = MockNetworkManager()
        productService = ProductService(networkService: mockNetworkManager)
    }

    override func tearDown() {
        productService = nil
        mockNetworkManager = nil
        super.tearDown()
    }
   
    func testProductServiceSeccess() {
        mockNetworkManager.data = MockData.productData
        let expectation = XCTestExpectation(description: "Product Service Success")
        productService.getProductsFromNetwork { result in
            switch result {
            case .success(let products):
                XCTAssertNotNil(products)
            case .failure(let error):
                XCTFail("Error: \(error)")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }

    func testProductServiceFailure() {
        mockNetworkManager.error = NSError(domain: "No  Data", code: 0)
        let expectation = XCTestExpectation(description: "Product Service Failure")
        productService.getProductsFromNetwork { result in
            switch result {
            case .success:
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, NetworkError.noData.localizedDescription)
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }


}
