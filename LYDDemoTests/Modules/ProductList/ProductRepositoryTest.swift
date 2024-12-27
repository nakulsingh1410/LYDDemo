//
//  ProductRepositoryTest.swift
//  LYDDemoTests
//
//  Created by Singh, Nakul on 25/12/24.
//

import XCTest
@testable import LYDDemo

final class ProductRepositoryTest: XCTestCase {

    var mockNetworkService: NetworkServiceProtocol!
    var productRepository: ProductRepositoryProtocol!
   
    override func setUp() {
        super.setUp()
        mockNetworkService = MockNetworkManager()
        productRepository = ProductRepository(networkService: mockNetworkService)
    }
    
    override func tearDown() {
        mockNetworkService = nil
        productRepository = nil
        super.tearDown()
    }

    func testSuccessScenario() {
        let produtcList = MockData.produtcList
        if let mockService = mockNetworkService as? MockNetworkManager {
            mockService.data = MockData.productData
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
        if let mockService = mockNetworkService as? MockNetworkManager {
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
