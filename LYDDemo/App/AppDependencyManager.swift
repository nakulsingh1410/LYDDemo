//
//  Untitled.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 28/12/24.
//

final class AppDependencyManager {
    static let shared = AppDependencyManager()
    private init() {}
    
    // Global Dependency
    lazy var navigationManger: NavigationManager = {
        NavigationManager()
    }()
    
    lazy var networkService: NetworkManagerProtocol = {
        NetworkManager()
    }()
    
    
    //Module specific dependencies
    lazy var productModule: ProductModule = {
        ProductModule(networkService: networkService)
    }()
    
}
