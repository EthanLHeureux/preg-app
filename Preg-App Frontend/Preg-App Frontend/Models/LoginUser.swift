//
//  LoginUser.swift
//  Preg-App Frontend
//
//  Created by Abraham Gomez Jr on 4/11/26.
//

import Foundation

// Codable encodes and decodes the JSON into Swift or vice versa
// Identifiable allows each User to be uniquely identifiable
nonisolated struct LoginUser: Codable {
    let email: String
    let password: String
}
