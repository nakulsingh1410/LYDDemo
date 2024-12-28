//
//  ProductModule.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 28/12/24.
//

final class ProductModule {
    private let networkService: NetworkServiceProtocol
    private let productService: ProductServiceProtocol
    private let repository: ProductRepositoryProtocol
    private let useCase: FetchProductUseCase
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
        self.productService = ProductService(networkService: networkService)
        self.repository = ProductRepository(productService: productService)
        self.useCase = FetchProductUseCaseImpl(repository: repository)
    }
    
    func makeProductListView() -> ProductListView {
        let viewModel = ProductListViewModel(useCase: useCase)
        return ProductListView(viewModel: viewModel)
    }
}
