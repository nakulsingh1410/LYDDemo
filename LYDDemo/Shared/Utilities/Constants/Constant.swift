//
//  ProductListConstant.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 25/12/24.
//

struct Constant {
    struct ProductListConstant {
        static let title = "Products"
        static let loadingMessage = "Loading products..."
        static let errorLabel = "Error message"
        static let productNameLabel = "Product Name"
        static let productPriceLabel = "Product Price"
        static let productListLabel = "Product List"
        static let productListScreenLabel = "Product list screen"
    }
    
    struct ProductDetailConstant {
        static let title = "Product Details"
        static let productNameLabel = "Product Name"
        static let productPriceLabel = "Product Price"
        static let productDescriptionLabel = "Product Description"
        static let productDetailScreenLabel = "Product Detail Screen"
    }
    
    struct API {
        static let productListApi = "https://fakestoreapiserver.reactbd.com/products"
    }
}
