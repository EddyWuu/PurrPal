//
//  AdoptionView.swift
//  PurrPal
//
//  Created by Edmond Wu on 2024-09-29.
//

import SwiftUI

struct AdoptionView: View {
    @StateObject private var viewModel = AdoptionViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                } else {
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.adoptions) { adoption in
                            AdoptionCardView(adoption: adoption)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Adoptions")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.fetchAdoptions()
            }
        }
    }
}

struct AdoptionCardView: View {
    
    let adoption: CatForAdoption
    
    var body: some View {
        VStack(alignment: .leading) {
            if let photo = adoption.photo, let imageUrl = URL(string: photo) {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
                } placeholder: {
                    ProgressView()
                }
            } else {
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 200)
                    .overlay(Text("No Image").foregroundColor(.white))
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(adoption.name)
                    .font(.headline)
                Text("Breed: \(adoption.breed)")
                    .font(.subheadline)
                Text("Age: \(adoption.age)")
                    .font(.subheadline)
                Text("Location: \(adoption.location)")
                    .font(.subheadline)
            }
            .padding()
        }
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
