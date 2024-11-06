//
//  CatBreedInfoService.swift
//  PurrPal
//
//  Created by Edmond Wu on 2024-11-05.
//

import SwiftUI
import FirebaseFirestore

class CatBreedInfoService {
    private let db = Firestore.firestore()
    
    func fetchCatBreeds() async throws -> [CatBreed] {
        
        // async retrieve all documents in CatBreeds colleciton
        let snapshot = try await db.collection("CatBreeds").getDocuments()
        
        // map to my model catbreeds
        let breeds = try snapshot.documents.compactMap { document in
            try document.data(as: CatBreed.self)
        }
        
        return breeds
    }
}
