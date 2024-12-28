//
//  LYDDemoApp.swift
//  LYDDemo
//
//  Created by Singh, Nakul on 24/12/24.
//

import SwiftUI

@main
struct LYDDemoApp: App {
    private let container = AppDependencyManager.shared
    
    var body: some Scene {
        WindowGroup {
            container.productModule.makeProductListView()
                .environmentObject(container.navigationManger)
        }
    }
}
