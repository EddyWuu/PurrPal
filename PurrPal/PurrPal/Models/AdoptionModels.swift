//
//  AdoptionModels.swift
//  PurrPal
//
//  Created by Edmond Wu on 2024-09-29.
//

import Foundation

struct CatForAdoption: Identifiable, Codable {
    let id: Int
    let name: String
    let breed: String
    let age: String
    let gender: String
    let description: String
    let location: String
    let imageUrl: String
}
