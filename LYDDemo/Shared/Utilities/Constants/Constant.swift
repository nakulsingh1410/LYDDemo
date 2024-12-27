//
//  ProductListConstant.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 25/12/24.
//

struct Constant {
    
    struct ProductList {
        static let title = "Products"
        static let loadingMessage = "Loading products..."
        static let errorMessage = "Error message"
        static let nameLabel = "Product Name"
        static let priceLabel = "Product Price"
        static let screenLabel = "Product list screen"
    }
    
    struct ProductDetail {
        static let title = "Product Details"
        static let nameLabel = "Product Name"
        static let priceLabel = "Product Price"
        static let descriptionLabel = "Product Description"
        static let screenLabel = "Product Detail Screen"
    }
    
    struct API {
        // Base URL
        static let host = "fakestoreapiserver.reactbd.com"
       
        // Endpoints
        static let productsPath = "/products"
    }
}
