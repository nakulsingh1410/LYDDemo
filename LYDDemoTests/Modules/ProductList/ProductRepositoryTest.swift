//
//  ProductRepositoryTest.swift
//  LYDDemoTests
//
//  Created by Singh, Nakul on 25/12/24.
//

import XCTest
@testable import LYDDemo

final class ProductRepositoryTest: XCTestCase {

    var mockService: ProductServiceProtocol!
    var productRepository: ProductRepositoryProtocol!
   
    override func setUp() {
        super.setUp()
        mockService = MockProductService()
        productRepository = ProductRepository(productService: mockService)
    }
    
    override func tearDown() {
        mockService = nil
        productRepository = nil
        super.tearDown()
    }

    func testSuccessScenario() {
        let produtcList = MockData.produtsResponse
        if let mockService = mockService as? MockProductService {
            mockService.response = produtcList
        }
        
        let expectation = expectation(description: "ProductRepository Success case")
        productRepository.getProducts { result in
            switch result {
            case .success(let products):
                XCTAssertEqual(products.count, 3)
                XCTAssertEqual(products.count, produtcList.count)
                XCTAssertEqual(products[0].title, produtcList[0].title)
            case .failure:
                XCTFail()
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 2)
    }

    func testFailureScenario() {
        if let mockService = mockService as? MockProductService {
            mockService.error = NetworkError.noData
        }
        
        let expectation = expectation(description: "ProductRepository Failure case")
        productRepository.getProducts { result in
            switch result {
            case .success:
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, NetworkError.noData.localizedDescription)
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 2)
    }
}
