//
//  CatBreedsDetailView.swift
//  PurrPal
//
//  Created by Edmond Wu on 2024-11-05.
//

import SwiftUI

struct CatBreedsDetailView: View {
 
    let catBreed: CatBreed
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 16) {
                
                Image(catBreed.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200, alignment: .center)
                    .clipShape(Circle())
                    .cornerRadius(10)
                    .shadow(radius: 5)
                
                Text(catBreed.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.brown.opacity(0.8))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Temperament")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.bottom, 5)
                    
                    Text(catBreed.temperament)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("origin")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.bottom, 5)
                    
                    Text(catBreed.origin)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Life Span")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.bottom, 5)
                    
                    Text("\(catBreed.lifespan) years")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(.horizontal)
                
                
                Spacer()
            }
            .padding()
            .navigationTitle("Breed Details")
            .navigationBarBackButtonHidden(true)
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
}
