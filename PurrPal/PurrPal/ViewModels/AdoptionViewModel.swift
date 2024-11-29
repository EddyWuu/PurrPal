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

    
    func fetchAdoptions() {
        
        isLoading = true
        errorMessage = nil
        
        // test url for now, move ot firebase later
        guard let url = URL(string: "https://api.adoptapet.com/search/limited_pet_details?key=hg4nsv85lppeoqqixy3tnt3k8lj6o0c&v=2&output=json&type=cat&location=90210&limit=10") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.isLoading = false
            }
            
            if let error = error {
                DispatchQueue.main.async {
                    self?.errorMessage = "Failed to load data: \(error.localizedDescription)"
                }
                print("Network Error: \(error.localizedDescription)")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Response Code: \(httpResponse.statusCode)")
                if httpResponse.statusCode == 404 {
                    print("Endpoint not found. Check URL or query parameters.")
                }
            }

            if let data = data {
                let responseBody = String(data: data, encoding: .utf8) ?? "No response body"
                print("Response Body: \(responseBody)")
            }

            guard let data = data else {
                DispatchQueue.main.async {
                    self?.errorMessage = "No data received"
                }
                return
            }

            do {
                let decodedData = try JSONDecoder().decode([CatForAdoption].self, from: data)
                DispatchQueue.main.async {
                    self?.adoptions = decodedData
                }
            } catch {
                DispatchQueue.main.async {
                    self?.errorMessage = "Failed to parse JSON: \(error.localizedDescription)"
                }
                print("JSON Decoding Error: \(error.localizedDescription)")
            }
        }.resume()
    }

}
