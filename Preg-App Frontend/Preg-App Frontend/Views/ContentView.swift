//
//  ContentView.swift
//  Preg-App Frontend
//
//  Created by Ethan L'Heureux on 4/7/26.
//

import SwiftUI

struct ContentView: View {
    
    // Accepts the authViewModel instance injection from App start.
    @EnvironmentObject var authViewModel: AuthViewModel
    
    // Directs to a specific view page depending on user login status.
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
