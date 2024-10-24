//
//  EncyclopediaView.swift
//  PurrPal
//
//  Created by Edmond Wu on 2024-09-29.
//

import SwiftUI

struct EncyclopediaView: View {
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                NavigationLink(destination: CatBreedsView()) {
                    Text("Cat Breeds")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.brown.opacity(0.2))
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationTitle("Encyclopedia")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
