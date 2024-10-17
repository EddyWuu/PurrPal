//
//  CatImageSevice.swift
//  PurrPal
//
//  Created by Edmond Wu on 2024-09-29.
//

import Foundation
import FirebaseRemoteConfig

class CatImageService {

    // the cat api, this api key is revoked by me, only to be used as test before, and will be replaced more securely in server
    let apiKey = "live_ibEHalO6bRqoSwH2ho8g8h3xBRaOp55OiLJPrWeIh0K5gJtjGVX2WpzNJclOnOMX"

    func fetchTenRandomCatImage(completion: @escaping (Result<[CatImage], Error>) -> Void) {
        let urlString = "https://api.thecatapi.com/v1/images/search?limit=10"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.addValue(apiKey, forHTTPHeaderField: "x-api-key")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                // network error
                print("Error fetching images: \(error)")
                completion(.failure(error))
                return
            }

            guard let data = data else {
                print("No data received")
                completion(.failure(NSError(domain: "No data", code: -1, userInfo: nil)))
                return
            }

            do {
                let images = try JSONDecoder().decode([CatImage].self, from: data)
                completion(.success(images))
            } catch {
                print("Error decoding JSON: \(error)")
                completion(.failure(error))
            }
        }.resume()
    }
}
