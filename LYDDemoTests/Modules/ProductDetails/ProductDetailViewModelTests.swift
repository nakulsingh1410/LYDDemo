//
//  ProductDetailViewModelTests.swift
//  LYDDemoTests
//
//  Created by Singh, Nakul on 26/12/24.
//

import XCTest
@testable import LYDDemo

final class ProductDetailViewModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testProductInitialization() throws {
        let mockProduct = Product(_id: 1, title: "Test Product", price: 20.50, description: "test product")
        let viewModel = ProductDetailViewModel(product: mockProduct)
        
        XCTAssertEqual(viewModel.product._id, 1)
        XCTAssertEqual(viewModel.product.title, "Test Product")
        XCTAssertEqual(viewModel.product.price, 20.50)
        XCTAssertEqual(viewModel.product.description, "test product")
    }
    
    
}
