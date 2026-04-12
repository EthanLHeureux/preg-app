//
//  CreateUser.swift
//  Preg-App Frontend
//
//  Created by Abraham Gomez Jr on 4/11/26.
//

import Foundation

struct CreateUser: Codable {
    let email: String
    let password: String
    let name: String
    let current_week: Int
    let due_date: Date
}
