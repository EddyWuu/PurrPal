//
//  CatBreedsView.swift
//  PurrPal
//
//  Created by Edmond Wu on 2024-10-23.
//

import SwiftUI

struct CatBreedsView: View {
    
    let catBreeds = ["siamese", "bengal", "maine coon", "turkish angora", "turkish van", "ragdoll", "birman", "sphynx", "munchkin", "burmese"]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ScrollView {
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                ForEach(catBreeds, id: \.self) { breed in
                    Button(action: {
                        // breed info
                    }) {
                        Text(breed)
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 170, height: 140)
                            .background(Color.brown.opacity(0.5))
                            .cornerRadius(10)

                    }
                }
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Cat Breeds")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.white)
                }
            }
        }
    }
}

