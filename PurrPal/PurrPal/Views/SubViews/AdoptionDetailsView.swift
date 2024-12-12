//
//  AdoptionDetailsView.swift
//  PurrPal
//
//  Created by Edmond Wu on 2024-12-12.
//

import SwiftUI

struct AdoptionDetailsView: View {
    
    let adoption: CatForAdoption

    var body: some View {
        VStack(spacing: 16) {
            if let photo = adoption.photo, let imageUrl = URL(string: photo) {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                        .clipped()
                } placeholder: {
                    ProgressView()
                }
            } else {
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 300)
                    .overlay(Text("No Image").foregroundColor(.white))
            }

            VStack(alignment: .leading, spacing: 8) {
                Text(adoption.name)
                    .font(.largeTitle)
                    .bold()
                Text("Breed: \(adoption.breed)")
                    .font(.title2)
                Text("Age: \(adoption.age)")
                    .font(.title3)
                Text("Location: \(adoption.location)")
                    .font(.body)
                Text("Description: ...")
                    .font(.body)
                    .padding(.top)
            }
            .padding()

            Spacer()

            Button(action: {
                // prob a link
            }) {
                Text("Adopt \(adoption.name)")
                    .bold()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .padding()
        .navigationTitle("Adoption Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
