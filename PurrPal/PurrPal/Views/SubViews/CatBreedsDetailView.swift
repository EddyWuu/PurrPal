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
        VStack(alignment: .leading, spacing: 16) {
            Text(catBreed.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Temperament:")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text(catBreed.temperament)
                .font(.body)
                .foregroundColor(.secondary)
            
            Spacer()
        }
        .padding()
        .navigationTitle(catBreed.name)
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
