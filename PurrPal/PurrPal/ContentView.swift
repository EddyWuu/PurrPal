//
//  ContentView.swift
//  PurrPal
//
//  Created by Edmond Wu on 2024-09-29.
//

import SwiftUI

// class to manage tab views
class NavigationManager: ObservableObject {
    
    @Published var selectedTab: Tab = .home
    
    enum Tab {
        case home
        case encyclopedia
        case adoption
        case shop
        case guide
    }
}


struct ContentView: View {
    
    @StateObject var navigationManager = NavigationManager()
    
    var body: some View {
        
        TabView(selection: $navigationManager.selectedTab) {
            HomeView()
                .tag(NavigationManager.Tab.home)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            EncyclopediaView()
                .tag(NavigationManager.Tab.encyclopedia)
                .tabItem {
                    Label("Encyclopedia", systemImage: "book")
                }
            
            AdoptionView()
                .tag(NavigationManager.Tab.adoption)
                .tabItem {
                    Label("Adoption", systemImage: "pawprint")
                }
            
            ShopView()
                .tag(NavigationManager.Tab.shop)
                .tabItem {
                    Label("Shop", systemImage: "cart")
                }
        
            GuideView()
                .tag(NavigationManager.Tab.guide)
                .tabItem {
                    Label("Guide", systemImage: "lightbulb")
                }
        }
    }
}

#Preview {
    ContentView()
}
