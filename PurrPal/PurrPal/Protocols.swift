//
//  Protocols.swift
//  PurrPal
//
//  Created by Edmond Wu on 2024-09-29.
//

import Foundation

// sections for home
protocol SectionViewModelProtocol: ObservableObject {
    
    var isLoading: Bool { get set }
    var hasError: Bool { get set }

    // all will need to fetch data
    func fetchData()
}
