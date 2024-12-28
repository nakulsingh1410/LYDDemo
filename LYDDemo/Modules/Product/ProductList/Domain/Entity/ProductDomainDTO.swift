//
//  Product.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 24/12/24.
//

struct ProductDomainDTO {
    let id: Int
    let title: String
    let price: Double
    let description: String
}

extension ProductDomainDTO {
   
    func toPresentation() -> Product{
        Product(id: id, title: title, price: price, description: description)
    }
}
