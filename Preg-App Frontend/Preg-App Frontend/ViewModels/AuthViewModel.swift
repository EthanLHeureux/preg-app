//
//  AuthViewModel.swift
//  Preg-App Frontend
//
//  Created by Abraham Gomez Jr on 4/11/26.
//

import SwiftUI
import Combine

// Allows this class to be change state, depending on if the user has logged in or not.
// ObservableObject is an example of observer design pattern.
class AuthViewModel: ObservableObject {
    @Published var isLoggedIn = false
    @Published var isLoading = false
    @Published var didCreateAccount = false
    @Published var user: LoginUser?

    // Handles the call to the API Service to request the backend to create a user with specific values.
    func createUser(email: String, password: String, name: String, current_week: String, dueDate: Date) {

        isLoading = true
        
        // current_week was given as a string in the create user view, so we need to turn it into an int.
        guard let weekInt = Int(current_week) else {
                print("Must be number")
                return
            }

        APIService.shared.createUser(
            email: email,
            password: password,
            name: name,
            current_week: weekInt,
            dueDate: dueDate
        ) { result in

            // Works similiarly to the fetchWeek function.
            DispatchQueue.main.async {
                self.isLoading = false

                switch result {
                case .success:
                    print("User created successfully")
                    self.didCreateAccount = true

                case .failure(let error):
                    print("Create user failed:", error)
                }
            }
        }
    }
    
    // Handles the call to the API Service to request the backend to validate user login credentials.
    func login(email: String, password: String) {

        isLoading = true
        
        APIService.shared.login(email: email, password: password) { result in

            DispatchQueue.main.async {
                self.isLoading = false

                switch result {
                case .success(let user):
                    self.user = user
                    self.isLoggedIn = true

                case .failure(let error):
                    print("Login failed:", error)
                }
            }
        }
    }
}
