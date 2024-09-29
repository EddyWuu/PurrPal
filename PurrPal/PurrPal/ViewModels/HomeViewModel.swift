//
//  HomeViewModel.swift
//  PurrPal
//
//  Created by Edmond Wu on 2024-09-29.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    // url for cat image
    @Published var imageUrl: String? = nil
    
    private let catImageService = CatImageService()

    init() {
        fetchRandomCatImage()
    }

    func fetchRandomCatImage() {
        catImageService.fetchRandomCatImage { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let catImage):
                    // store the cat image in imageUrl
                    self.imageUrl = catImage.url
                case .failure(let error):
                    print("Failed to fetch cat image: \(error)")
                }
            }
        }
    }
}
