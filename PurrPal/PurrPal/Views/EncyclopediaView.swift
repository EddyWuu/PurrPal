//
//  EncyclopediaView.swift
//  PurrPal
//
//  Created by Edmond Wu on 2024-09-29.
//

import SwiftUI

struct EncyclopediaView: View {
    
    var body: some View {
        NavigationView {
            ScrollView {

                Text("info")
            }
            .navigationTitle("Encyclopedia")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
