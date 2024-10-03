//
//  GuideView.swift
//  PurrPal
//
//  Created by Edmond Wu on 2024-09-29.
//

import SwiftUI

struct GuideView: View {
    
    var body: some View {
        NavigationView {
            ScrollView {

                Text("guide")
            }
            .navigationTitle("Guide")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
