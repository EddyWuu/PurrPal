//
//  CatImageSevice.swift
//  PurrPal
//
//  Created by Edmond Wu on 2024-09-29.
//

import Foundation
import FirebaseRemoteConfig

class CatImageService {
    
    // keep private, cant expose, if exposed, revoke and make new keys
    private var theCatApiKey: String = ""
    
    init() {
        // initialize with fetching
        fetchTheCatApiKey { success in
            if success {
                print("The Cat API Key Fetched Successfully")
            } else {
                print("Failed to fetch the API key")
            }
        }
    }
    
    // fetch the cat api key from my firebase remote config
    func fetchTheCatApiKey(completion: @escaping (Bool) -> Void) {
        
        let remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0 // no throttle
        remoteConfig.configSettings = settings

        // fetch, ignore cache since i set expiration to 0
        remoteConfig.fetch(withExpirationDuration: 0) { status, error in
            
            // if failed, print error
            if let error = error {
                print("Remote config fetch failed: \(error.localizedDescription)")
                completion(false)
                return
            }
            
            // if success fetching remote config, get key
            print("Remote config fetched successfully")
            
            // activate fetch config
            remoteConfig.activate { changed, activationError in
                // activate error check
                if let activationError = activationError {
                    print("Remote config activation failed: \(activationError.localizedDescription)")
                    completion(false)
                    return
                }
                
                print("Remote config activated, changes: \(changed)")
                
                let apiKey = remoteConfig.configValue(forKey: "TheCatAPIKey").stringValue
                
                // check the api key
                if !apiKey.isEmpty {
                    print("API Key fetched")
                    self.theCatApiKey = apiKey
                    completion(true)
                } else {
                    print("API Key is empty or missing")
                    completion(false)
                }
            }
        }
    }



    
    // Fetch 10 random cat images
    func fetchTenRandomCatImage(completion: @escaping (Result<[CatImage], Error>) -> Void) {
        guard !theCatApiKey.isEmpty else {
            print("API key not ready")
            completion(.failure(NSError(domain: "API key not fetched", code: -1, userInfo: nil)))
            return
        }
        
        let urlString = "https://api.thecatapi.com/v1/images/search?limit=10"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.addValue(theCatApiKey, forHTTPHeaderField: "x-api-key")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
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
