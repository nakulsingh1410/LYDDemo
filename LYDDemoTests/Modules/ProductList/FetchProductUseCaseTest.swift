//
//  FetchProductUseCaseTest.swift
//  LYDDemoTests
//
//  Created by Singh, Nakul on 24/12/24.
//

import XCTest
@testable import LYDDemo

final class FetchProductUseCaseTest: XCTestCase {
    var mockProductRepo: ProductRepositoryProtocol!
    var useCase: FetchProductUseCaseProtocol!

    override func setUp() {
        super.setUp()
        mockProductRepo = MockProductRepository()
        useCase = FetchProductUseCase(repository: mockProductRepo)
    }
    
    override func tearDown() {
        mockProductRepo = nil
        useCase = nil
        super.tearDown()
    }

    func testProductListUseCaseSuccess() {
        if let mockProductRepo = mockProductRepo as? MockProductRepository {
            mockProductRepo.products = MockData.produtcList
        }
        let expectation = self.expectation(description: "ProductListUseCase Success case")
        
        useCase.fetchProduct { result in
            switch result {
            case .success(let products):
                XCTAssertEqual(products.count, 3, "The number of products should match the expected count.")
                expectation.fulfill()  // Fulfill the expectation when the result is successful
            case .failure:
                XCTFail("Fetching products failed unexpectedly")
            }
        }
        waitForExpectations(timeout: 2.0)
    }
    
    func testProductListUseCaseFailure() {
        if let mockService = mockProductRepo as? MockProductRepository {
            mockService.error = NetworkError.noData
        }
        let expectation = self.expectation(description: "ProductListUseCase Failure case")
        
        useCase.fetchProduct { result in
            switch result {
            case .success:
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, NetworkError.noData.localizedDescription)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 2.0)
    }
}
