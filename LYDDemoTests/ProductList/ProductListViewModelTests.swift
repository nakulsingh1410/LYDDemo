//
//  ProductListViewModelTests.swift
//  LYDDemoTests
//
//  Created by Singh, Nakul on 24/12/24.
//

import XCTest
@testable import LYDDemo

final class ProductListViewModelTests: XCTestCase {
    
    var mockUseCase: MockFetchProductUseCase!
    var viewModel: ProductListViewModel!
    
    override func setUp() {
        super.setUp()
        mockUseCase = MockFetchProductUseCase()
        viewModel = ProductListViewModel(useCase: mockUseCase)
    }
    
    override func tearDown() {
        mockUseCase = nil
        viewModel = nil
        super.tearDown()
    }
    
    func testSuccessScenario()  {
        let expectedProducts = MockData.produtcList
        mockUseCase.products = expectedProducts
        viewModel.fetchProducts()
        
        let expectation = XCTestExpectation(description: "Fetch products success case")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertFalse(self.viewModel.isLoading, "ViewModel should stop loading after fetching.")
            XCTAssertEqual(self.viewModel.products.first?._id, expectedProducts[0]._id)
            XCTAssertNil(self.viewModel.errorMesage, "Error message should be nil on success.")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testFailureScenario() {
        let expectedError = NetworkError.invalidData
        mockUseCase.error = expectedError
        viewModel.fetchProducts()
        
        let expectation = XCTestExpectation(description: "Fetch products failure case")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertFalse(self.viewModel.isLoading, "ViewModel should stop loading after fetching.")
            XCTAssertTrue(self.viewModel.products.isEmpty, "Products array should be empty on failure.")
            XCTAssertEqual(self.viewModel.errorMesage, expectedError.localizedDescription)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }

}
