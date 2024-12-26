//
//  NavigationManager.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 26/12/24.
//

import SwiftUI

enum AppRoute: Hashable {
    case productList
    case productDetail(product: Product)
}

final class NavigationManager: ObservableObject {
    @Published var navigationPath = NavigationPath()
    
    func navigateTo<T: Hashable>(_ route: T) {
        navigationPath.append(route)
    }
    
    func navigateToRoot() {
        navigationPath = NavigationPath()
    }
    
    func navigateBack() {
        navigationPath.removeLast()
    }
}
