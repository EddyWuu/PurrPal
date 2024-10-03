//
//  PurrPalApp.swift
//  PurrPal
//
//  Created by Edmond Wu on 2024-09-29.
//

import SwiftUI

@main
struct PurrPalApp: App {
    
    init() {
        // set up my nav bar on start
        setNavigationBarAppearance()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    func setNavigationBarAppearance() {
        
        let appearance = UINavigationBarAppearance()
        
        // bar color
        appearance.backgroundColor = UIColor(
            red: 183/255,
            green: 135/255,
            blue: 51/255,
            alpha: 1
        )
        
        // title
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "HelveticaNeue-Bold", size: 20) ?? .systemFont(ofSize: 10)
        ]
        
        
        // apply the appearance to all UINavigationBars
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
