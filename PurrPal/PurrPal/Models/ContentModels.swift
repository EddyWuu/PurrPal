//
//  ContentModels.swift
//  PurrPal
//
//  Created by Edmond Wu on 2024-09-29.
//

import Foundation

struct CatBreed: Identifiable, Codable {
    let id: String
    let name: String
//    let origin: String
//    let description: String
    let temperament: String
//    let lifeSpan: String
//    let imageUrl: String
//    let careTips: String
//    let history: String
}

struct Guide: Identifiable, Codable {
    let id: Int
    let title: String
    let shortDescription: String
    let fullContent: String
    let imageUrl: String
    let videoUrl: String?
}

struct CatNews: Identifiable, Codable {
    let id: Int
    let title: String
    let summary: String
    let url: String
    let imageUrl: String
    let publicationDate: Date
}

struct CatVideo: Identifiable, Codable {
    let id: String
    let title: String
    let thumbnailUrl: String
    let videoUrl: String
}

struct CatImage: Identifiable, Codable {
    let id: String
    let url: String
}
