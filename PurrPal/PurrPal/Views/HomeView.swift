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
                if viewModel.catImages.isEmpty {
                    ProgressView("Loading cat images...")
                        .frame(height: 300)
                } else {
                    // Carousel for cat images
                    TabView(selection: $viewModel.currentIndex) {
                        ForEach(0..<viewModel.catImages.count, id: \.self) { index in
                            if let url = URL(string: viewModel.catImages[index].url) {
                                AsyncImage(url: url) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: UIScreen.main.bounds.width, height: 300)
                                        .clipped()
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: UIScreen.main.bounds.width, height: 300)
                                }
                            }
                        }
                    }
                    .frame(height: 300)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Hide default dots

                    // custom pagination dots
                    HStack(spacing: 8) {
                        ForEach(0..<viewModel.catImages.count, id: \.self) { index in
                            if viewModel.isDotVisible(for: index) { // Show only visible dots
                                Circle()
                                    .fill(index == viewModel.currentIndex ? Color.blue : Color.gray)
                                    .frame(width: 5, height: 5)
                                    .opacity(viewModel.dotOpacity(for: index)) // Set the opacity based on distance
                                    .animation(.easeInOut, value: viewModel.currentIndex)
                            }
                        }
                    }
                    .padding(.top, 8)
                }
            }
            .navigationTitle("Today's Dose of Dopamine")
        }
    }
}
