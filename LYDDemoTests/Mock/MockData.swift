//
//  MockData.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 24/12/24.
//

import Foundation

@testable import LYDDemo

class MockData {
    
    static var produtcList: [Product]  {
        try! JSONDecoder().decode([Product].self, from: productData)
    }
    
    static var productData: Data {
        loadJsonData(fileName: "productList") ?? Data()
    }
    
    private static func loadJsonData(fileName: String) -> Data? {
        let bundle = Bundle(for: self)
        guard let path = bundle.path(forResource: fileName, ofType: "json") else {
            print("Error: File \(fileName).json not found in bundle.")
            return nil
        }
        
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: path))
            return jsonData
        } catch {
            print("Error reading JSON file: \(error.localizedDescription)")
            return nil
        }
    }
}

        
       
