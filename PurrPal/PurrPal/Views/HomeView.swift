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
                    // carousel for cat images
                    TabView(selection: $viewModel.currentIndex) {
                        ForEach(0..<viewModel.catImages.count, id: \.self) { index in
                            if let url = URL(string: viewModel.catImages[index].url) {
                                AsyncImage(url: url) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: UIScreen.main.bounds.width - 40, height: 250)
                                        .clipped()
                                        .padding()
                                        .background(Color.brown.opacity(0.2))
                                        .cornerRadius(20)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.brown, lineWidth: 4)
                                        )
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: UIScreen.main.bounds.width - 40, height: 250)
                                        .background(Color.brown.opacity(0.2))
                                        .cornerRadius(20)
                                }
                            }
                        }
                    }
                    .frame(height: 300)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

                    // custom dots
                    HStack(spacing: 8) {
                        ForEach(0..<viewModel.catImages.count, id: \.self) { index in
                            if viewModel.isDotVisible(for: index) {
                                Circle()
                                    .fill(index == viewModel.currentIndex ? Color.blue : Color.gray)
                                    .frame(width: 5, height: 5)
                                    .opacity(viewModel.dotOpacity(for: index))
                                    .animation(.linear, value: viewModel.currentIndex)
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
