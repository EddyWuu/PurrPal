//
//  EncyclopediaView.swift
//  PurrPal
//
//  Created by Edmond Wu on 2024-09-29.
//

import SwiftUI

struct EncyclopediaView: View {
    
    // an instance of CatBreedInfoService, created once and reused
    private let catBreedInfoService = CatBreedInfoService()
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                
                NavigationLink(destination: CatBreedsView(catBreedInfoService: CatBreedInfoService())) {
                    Text("Breeds")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.brown.opacity(0.2))
                        .cornerRadius(10)
                }
                .padding()
                
//                NavigationLink(destination: CatBreedsView()) {
//                    Text("Health and Nutrition")
//                        .font(.headline)
//                        .foregroundColor(.black)
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(Color.brown.opacity(0.2))
//                        .cornerRadius(10)
//                }
//                .padding()
//                
//                NavigationLink(destination: CatBreedsView()) {
//                    Text("Behaviour")
//                        .font(.headline)
//                        .foregroundColor(.black)
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(Color.brown.opacity(0.2))
//                        .cornerRadius(10)
//                }
//                .padding()
//                
//                NavigationLink(destination: CatBreedsView()) {
//                    Text("Historical Significance")
//                        .font(.headline)
//                        .foregroundColor(.black)
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(Color.brown.opacity(0.2))
//                        .cornerRadius(10)
//                }
//                .padding()
//                
//                NavigationLink(destination: CatBreedsView()) {
//                    Text("Stories")
//                        .font(.headline)
//                        .foregroundColor(.black)
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(Color.brown.opacity(0.2))
//                        .cornerRadius(10)
//                }
//                .padding()
//                
//                NavigationLink(destination: CatBreedsView()) {
//                    Text("Cat Anatomy")
//                        .font(.headline)
//                        .foregroundColor(.black)
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(Color.brown.opacity(0.2))
//                        .cornerRadius(10)
//                }
//                .padding()
                
            }
            .navigationTitle("Encyclopedia")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
