//
//  ProductResponse.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 28/12/24.
//

struct ProductResponse: Codable {
    let id: Int?
    let title: String?
    let price: Double?
    let description: String?
    
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title
        case price
        case description
    }
}

extension ProductResponse {
    func toDomain() -> ProductDomainDTO {
        .init(id: id ?? 0, title: title ?? "", price: price ?? 0, description: description ?? "")
    }
}
