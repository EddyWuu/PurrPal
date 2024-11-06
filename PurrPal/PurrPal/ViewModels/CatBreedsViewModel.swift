//
//  CatBreedsViewModel.swift
//  PurrPal
//
//  Created by Edmond Wu on 2024-11-05.
//

import SwiftUI
import Combine

import SwiftUI

class CatBreedsViewModel: ObservableObject {
    
    @Published var catBreeds: [CatBreed] = []
    private var catBreedInfoService: CatBreedInfoService
    
    init(catBreedInfoService: CatBreedInfoService) {
        
        self.catBreedInfoService = catBreedInfoService
        Task {
            await fetchCatBreeds()
        }
    }
    
    @MainActor
    func fetchCatBreeds() async {
        
        do {
            // an asynch fetch for the cat breeds
            let breeds = try await catBreedInfoService.fetchCatBreeds()
            self.catBreeds = breeds
            print("Cat breed fetch successful, VM side")
        } catch {
            print("Error fetching cat breeds: \(error)")
        }
    }
}
