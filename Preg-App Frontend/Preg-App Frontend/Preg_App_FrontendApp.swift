//
//  Preg_App_FrontendApp.swift
//  Preg-App Frontend
//
//  Created by Ethan L'Heureux on 4/7/26.
//

import SwiftUI


// Basically starts the frontend and sends the system to ContentView to figure out which view it needs to see first
@main
struct Preg_App_FrontendApp: App {
    
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authViewModel)
        }
    }
}
