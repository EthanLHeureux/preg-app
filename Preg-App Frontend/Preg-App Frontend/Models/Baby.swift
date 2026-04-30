//
//  Baby.swift
//  Preg-App Frontend
//
//  Created by Abraham Gomez Jr on 4/11/26.
//

import Foundation

// Codable allows the data to be encoded to JSON and decoded when needed.
struct Baby: Codable {
    let sizeComparison: String
    let expectedDevelopment: [String]
    let expectedWeight: String

    // When encoded and decoded, the CodingKeys ensure specific key names are used in JSON.
    enum CodingKeys: String, CodingKey {
        case sizeComparison = "size_comparison"
        case expectedDevelopment = "expected_development"
        case expectedWeight = "expected_weight"
    }
}
