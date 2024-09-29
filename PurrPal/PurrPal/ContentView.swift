//
//  ContentView.swift
//  PurrPal
//
//  Created by Edmond Wu on 2024-09-29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Image(systemName: "house") }
            
            EncyclopediaView()
                .tabItem { Image(systemName: "book") }
            
            AdoptionView()
                .tabItem { Image(systemName: "pawprint") }
            
            ShopView()
                .tabItem { Image(systemName: "cart") }
        
            GuideView()
                .tabItem { Image(systemName: "lightbulb") }
        }
    }
}

#Preview {
    ContentView()
}
