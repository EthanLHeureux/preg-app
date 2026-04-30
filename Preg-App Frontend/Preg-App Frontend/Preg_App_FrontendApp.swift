//
//  Preg_App_FrontendApp.swift
//  Preg-App Frontend
//
//  Created by Ethan L'Heureux on 4/7/26.
//

import SwiftUI


// Starts the frontend and sends the system to ContentView to figure out which view it needs to see first.
@main
struct Preg_App_FrontendApp: App {
    
    // Must be created here since authViewModel is involved in multiple features.
    // StateObject is the creation and ownership of an instance, while EnvironmentObject is how said object is
    // injected into different files when needed.
    @StateObject var authViewModel = AuthViewModel()
    
    // WindowGroup is a type of Scene that creates and manages windows. This group then contains a heirarchy to decide
    // which view appears in the window. In this case, ContentView is shown, with an instance of authViewModel injected into it.
    // Because authViewModel is injected here, any view that comes from ContentView can call upon it as an EnvironmentObject.
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authViewModel)
        }
    }
}
