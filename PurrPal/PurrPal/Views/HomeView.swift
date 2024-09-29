//
//  HomeView.swift
//  PurrPal
//
//  Created by Edmond Wu on 2024-09-29.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if let imageUrl = viewModel.imageUrl, let url = URL(string: imageUrl) {
                    // Use AsyncImage to load and display the cat image
                    AsyncImage(url: url) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10)
                                .padding()
                        } else if phase.error != nil {
                            Text("Failed to load image.")
                        } else {
                            ProgressView()
                        }
                    }
                } else {
                    ProgressView() // Show a loading spinner while fetching
                }
            }
            .navigationTitle("Random Cat Image")
            .onAppear {
                viewModel.fetchRandomCatImage() // Fetch the image when the view appears
            }
        }
    }
}
