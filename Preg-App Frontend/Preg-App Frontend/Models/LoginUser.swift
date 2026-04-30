//
//  LoginUser.swift
//  Preg-App Frontend
//
//  Created by Abraham Gomez Jr on 4/11/26.
//

import Foundation

// Nonisolated is used to allow this struct to be used in both the main thread and HTTP response background thread.
nonisolated struct LoginUser: Codable {
    let email: String
    let password: String
    let current_week: Int
}
