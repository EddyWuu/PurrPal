//
//  UtilityModels.swift
//  PurrPal
//
//  Created by Edmond Wu on 2024-09-29.
//

import Foundation

struct APIResponse<T: Codable>: Codable {
    let status: String
    let data: T
}
