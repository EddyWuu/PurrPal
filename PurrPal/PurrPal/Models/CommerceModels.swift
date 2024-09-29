//
//  CommerceModels.swift
//  PurrPal
//
//  Created by Edmond Wu on 2024-09-29.
//

import Foundation

struct Product: Identifiable, Codable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageUrl: String
    let productUrl: String
}

enum ProductCategory {
    case food
    case toys
    case accessories
}
