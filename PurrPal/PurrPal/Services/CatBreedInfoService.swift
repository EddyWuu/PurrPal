//
//  CatBreedInfoService.swift
//  PurrPal
//
//  Created by Edmond Wu on 2024-11-05.
//

import SwiftUI
import FirebaseFirestore

class CatBreedInfoService: ObservableObject {
    @Published var catBreeds: [CatBreed] = []
    
    private var db = Firestore.firestore()
    
    init() {
        fetchCatBreeds()
    }
    
    func fetchCatBreeds() {
        db.collection("CatBreeds").getDocuments { (snapshot, error) in
            if let error = error {
                print("Error fetching cat breeds: \(error)")
                return
            }
            
            if let snapshot = snapshot {
                print("Successfully fetched cat breeds")
                self.catBreeds = snapshot.documents.compactMap { document in
                    try? document.data(as: CatBreed.self)
                }
            }
        }
    }
}
