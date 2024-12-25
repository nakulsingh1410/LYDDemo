//
//  NetworkServiceTest.swift
//  LYDDemoTests
//
//  Created by Singh, Nakul on 25/12/24.
//

import XCTest
@testable import LYDDemo

final class NetworkServiceTest: XCTestCase {
    
    var networkService: NetworkService!
    
    override func setUp() {
        super.setUp()
        networkService = NetworkService()
    }
    
    override func tearDown() {
        networkService = nil
        super.tearDown()
    }
    
    func testFetchDataSuccess() {
        let validURL = Constant.API.productListApi
        let expectation = self.expectation(description: "Fetch data successfully")
        
        networkService.fetchData(url: validURL) { (result: Result<[Product], Error>) in
            switch result {
            case .success(let products):
                XCTAssertEqual(products.first?._id, 1)
                XCTAssertEqual(products.first?.title, "Long sleeve Jacket")
                expectation.fulfill()
            case .failure:
                XCTFail()
            }
        }
        
        waitForExpectations(timeout: 3.0)
    }

}
