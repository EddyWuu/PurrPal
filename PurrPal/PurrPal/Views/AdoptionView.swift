//
//  AdoptionView.swift
//  PurrPal
//
//  Created by Edmond Wu on 2024-09-29.
//

import SwiftUI

struct AdoptionView: View {
    @StateObject private var viewModel = AdoptionViewModel()
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                // using my search bar component
                SearchBar(text: $searchText)
                    .padding()

                ScrollView {
                    if viewModel.isLoading {
                        ProgressView("Loading...")
                    } else if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding()
                    } else {
                        LazyVStack(alignment: .leading, spacing: 16) {
                            ForEach(viewModel.filteredAdoptions(searchText: searchText)) { adoption in
                                AdoptionCardView(adoption: adoption)
                                    .frame(maxWidth: .infinity)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Adoptions")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchBar: View {
    
    @Binding var text: String

    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)

                        if !text.isEmpty {
                            Button(action: {
                                text = ""
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
        }
        .padding(.horizontal, 10)
    }
}

struct AdoptionCardView: View {
    
    let adoption: CatForAdoption
    @State private var showDetails = false

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
                    .frame(maxWidth: .infinity, maxHeight: 200)
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
                
                Button(action: {
                    showDetails = true
                }) {
                    Text("View Details")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                        .padding(.top, 8)
                }
                .sheet(isPresented: $showDetails) {
                    AdoptionDetailsView(adoption: adoption)
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
