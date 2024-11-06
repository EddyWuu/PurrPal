//
//  CatBreedsView.swift
//  PurrPal
//
//  Created by Edmond Wu on 2024-10-23.
//

import SwiftUI

struct CatBreedsView: View {
    
    @StateObject private var viewModel: CatBreedsViewModel = CatBreedsViewModel(catBreedInfoService: CatBreedInfoService())
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                ForEach(viewModel.catBreeds) { breed in
                    NavigationLink(destination: CatBreedsDetailView(catBreed: breed)) {
                        CatBreedCardView(breed: breed)
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
        .onAppear {
            Task {
                await viewModel.fetchCatBreeds()
            }
        }
    }
}


struct CatBreedCardView: View {
    
    let breed: CatBreed
    
    var body: some View {
        VStack {
            Text(breed.name)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 170, height: 140)
                .background(Color.brown.opacity(0.5))
                .cornerRadius(10)
        }
    }
}
