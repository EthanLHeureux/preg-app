//
//  Baby.swift
//  Preg-App Frontend
//
//  Created by Abraham Gomez Jr on 4/11/26.
//

import Foundation

struct Baby: Codable {
    let sizeComparison: String
    let expectedDevelopment: [String]
    let expectedWeight: String

    enum CodingKeys: String, CodingKey {
        case sizeComparison = "size_comparison"
        case expectedDevelopment = "expected_development"
        case expectedWeight = "expected_weight"
    }
}
