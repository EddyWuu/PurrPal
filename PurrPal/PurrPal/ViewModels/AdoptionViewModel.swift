//
//  AdoptionViewModel.swift
//  PurrPal
//
//  Created by Edmond Wu on 2024-11-28.
//

import SwiftUI

class AdoptionViewModel: ObservableObject {
    
    @Published var adoptions: [CatForAdoption] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    
    
    // api key cuurrently offline, using dummy data for now
//    func fetchAdoptions() {
//        
//        isLoading = true
//        errorMessage = nil
//        
//        // test url for now, move ot firebase later
//        guard let url = URL(string: "https://api.adoptapet.com/search/limited_pet_details?key=hg4nsv85lppeoqqixy3tnt3k8lj6o0c&v=2&output=json&type=cat&location=90210&limit=10") else {
//            print("Invalid URL")
//            return
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//
//        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
//            DispatchQueue.main.async {
//                self?.isLoading = false
//            }
//            
//            if let error = error {
//                DispatchQueue.main.async {
//                    self?.errorMessage = "Failed to load data: \(error.localizedDescription)"
//                }
//                print("Network Error: \(error.localizedDescription)")
//                return
//            }
//            
//            if let httpResponse = response as? HTTPURLResponse {
//                print("HTTP Response Code: \(httpResponse.statusCode)")
//                if httpResponse.statusCode == 404 {
//                    print("Endpoint not found. Check URL or query parameters.")
//                }
//            }
//
//            if let data = data {
//                let responseBody = String(data: data, encoding: .utf8) ?? "No response body"
//                print("Response Body: \(responseBody)")
//            }
//
//            guard let data = data else {
//                DispatchQueue.main.async {
//                    self?.errorMessage = "No data received"
//                }
//                return
//            }
//
//            do {
//                let decodedData = try JSONDecoder().decode([CatForAdoption].self, from: data)
//                DispatchQueue.main.async {
//                    self?.adoptions = decodedData
//                }
//            } catch {
//                DispatchQueue.main.async {
//                    self?.errorMessage = "Failed to parse JSON: \(error.localizedDescription)"
//                }
//                print("JSON Decoding Error: \(error.localizedDescription)")
//            }
//        }.resume()
//    }
    
    init() {
         fetchDummyAdoptions()
     }

     func fetchDummyAdoptions() {
         // Simulate a delay for loading (optional)
         DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
             self.adoptions = [
                 CatForAdoption(
                     id: "1",
                     name: "Ducks",
                     breed: "Persian",
                     age: "2 years",
                     location: "New York, NY",
                     photo: "https://placekitten.com/300/200"
                 ),
                 CatForAdoption(
                     id: "2",
                     name: "Pandas",
                     breed: "Siamese",
                     age: "1 year",
                     location: "Los Angeles, CA",
                     photo: "https://placekitten.com/300/201"
                 ),
                 CatForAdoption(
                     id: "3",
                     name: "Horses",
                     breed: "Maine Coon",
                     age: "3 years",
                     location: "Chicago, IL",
                     photo: "https://placekitten.com/300/202"
                 ),
                 CatForAdoption(
                     id: "4",
                     name: "Fish",
                     breed: "Ragdoll",
                     age: "6 months",
                     location: "Seattle, WA",
                     photo: "https://placekitten.com/300/203"
                 ),
                 CatForAdoption(
                     id: "5",
                     name: "Dog Dog Dog",
                     breed: "Himalayan",
                     age: "5 years",
                     location: "Austin, TX",
                     photo: "https://placekitten.com/300/204"
                 )
             ]
         }
     }

     // filter logic for search bar
     func filteredAdoptions(searchText: String) -> [CatForAdoption] {
         if searchText.isEmpty {
             return adoptions
         }
         return adoptions.filter { adoption in
             adoption.name.lowercased().contains(searchText.lowercased()) ||
             adoption.breed.lowercased().contains(searchText.lowercased()) ||
             adoption.location.lowercased().contains(searchText.lowercased())
         }
     }

}
