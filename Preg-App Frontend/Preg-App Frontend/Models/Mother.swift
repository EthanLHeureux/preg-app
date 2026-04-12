//
//  Mother.swift
//  Preg-App Frontend
//
//  Created by Abraham Gomez Jr on 4/11/26.
//

import Foundation

struct Mother: Codable {
    let bodyChanges: [String]
    let emotionalChanges: [String]
    let commonSymptoms: [String]

    enum CodingKeys: String, CodingKey {
        case bodyChanges = "body_changes"
        case emotionalChanges = "emotional_changes"
        case commonSymptoms = "common_symptoms"
    }
}
