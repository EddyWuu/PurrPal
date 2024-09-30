//
//  HomeViewModel.swift
//  PurrPal
//
//  Created by Edmond Wu on 2024-09-29.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    // list of cat images
    @Published var catImages: [CatImage] = []
    // current index for image carousel
    @Published var currentIndex: Int = 0
    
    private let catImageService = CatImageService()

    // initializer, start every function when HomeViewModel is called
    init() {
        fetchTenRandomCatImages()
    }
    
    func fetchTenRandomCatImages() {
        
        catImageService.fetchTenRandomCatImage { result in
            switch result {
            case .success(let catImages):
                // store cat images, do this on main thread
                DispatchQueue.main.async {
                    self.catImages = catImages 
                }
            case .failure(let error):
                // print error given error
                print("Error fetching cat images: \(error)")
            }
        }
    }
    
    // dot opacity
    func dotOpacity(for index: Int) -> Double {
        let distance = abs(index - currentIndex)
        return distance == 0 ? 1.0 : max(0.3, 1.0 - (0.3 * Double(distance)))
    }
    
    // make further dots not visible
    func isDotVisible(for index: Int) -> Bool {
        return abs(index - currentIndex) <= 2
    }
}
