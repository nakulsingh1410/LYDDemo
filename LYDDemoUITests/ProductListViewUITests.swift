//
//  LYDDemoUITests.swift
//  LYDDemoUITests
//
//  Created by Singh, Nakul on 24/12/24.
//

import XCTest
@testable import LYDDemo

final class ProductListViewUITests: XCTestCase {
    
    @MainActor
    func testProductListDisplay() {
        let app = XCUIApplication()
        app.launch()
        
        let firstProduct = app.staticTexts["Long sleeve Jacket"]
        let exists = firstProduct.waitForExistence(timeout: 5)
        XCTAssertTrue(exists)
        
    }

    @MainActor
    func testAccessibilty() {
        let app = XCUIApplication()
        app.launch()
        
        let firstProduct = app.staticTexts["Long sleeve Jacket"]
        let exists = firstProduct.waitForExistence(timeout: 5)
        XCTAssertTrue(exists)
        
        XCTAssertEqual(firstProduct.label, "Product Name")
        XCTAssertTrue(app.staticTexts["Product Price"].exists)
        
    }

}
