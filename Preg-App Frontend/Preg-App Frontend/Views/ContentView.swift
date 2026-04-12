//
//  ContentView.swift
//  Preg-App Frontend
//
//  Created by Ethan L'Heureux on 4/7/26.
//

import SwiftUI

struct ContentView: View {
    
    // Allows access to the shared AuthViewModel from anywhere in the app
    // THIS IS AN EXAMPLE OF OBSERVER DESIGN PATTERN
    @EnvironmentObject var authViewModel: AuthViewModel
    
    // Directs to a specific view page depending on login status
    var body: some View {
        Group{
            if authViewModel.isLoggedIn {
                HomePageView()
            } else{
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthViewModel())
}
