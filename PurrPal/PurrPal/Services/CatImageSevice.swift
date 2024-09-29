//
//  CatImageSevice.swift
//  PurrPal
//
//  Created by Edmond Wu on 2024-09-29.
//

import Foundation

class CatImageService {
    
    // my API key
    let apiKey = "live_ibEHalO6bRqoSwH2ho8g8h3xBRaOp55OiLJPrWeIh0K5gJtjGVX2WpzNJclOnOMX"

    func fetchRandomCatImage(completion: @escaping (Result<CatImage, Error>) -> Void) {
        
        // the Cat API endpoint to fetch a random cat image
        let urlString = "https://api.thecatapi.com/v1/images/search"
        
        guard let url = URL(string: urlString) else { return }

        // create a request and add the API key to the headers
        var request = URLRequest(url: url)
        request.addValue(apiKey, forHTTPHeaderField: "x-api-key")

        // perform the request
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: -1, userInfo: nil)))
                return
            }

            do {
                // the response is an array, so we decode it as an array of CatImage
                let images = try JSONDecoder().decode([CatImage].self, from: data)
                
                // we are only interested in the first image, so return it
                if let firstImage = images.first {
                    completion(.success(firstImage))
                } else {
                    completion(.failure(NSError(domain: "No image found", code: -1, userInfo: nil)))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume() // start the network task
    }
}
