//
//  CatBreedsView.swift
//  PurrPal
//
//  Created by Edmond Wu on 2024-10-23.
//

import SwiftUI

struct CatBreedsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ScrollView {
            Text("Cat Breeds")
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
    }
}

