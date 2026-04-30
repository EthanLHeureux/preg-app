//
//  LoginView.swift
//  Preg-App Frontend
//
//  Created by Abraham Gomez Jr on 4/11/26.
//

import SwiftUI

struct LoginView: View {

    @EnvironmentObject var authViewModel: AuthViewModel

    // These are variables that are private to the LoginView and that won't have their values erased
    // due to @State. The right hand sides of the equal signs are defintions of types that the variable
    // is expecting. They will contain the values of the user input which is stored in the $ versions of
    // these variables.
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        
        // Allows transfer from view to view based on the navigation link.
        NavigationStack{
            
            // Holds the input boxes for the login page.
            VStack {
            
                Text("Pregnancy App")
                    .foregroundColor(Color(#colorLiteral(red: 0.7978933454, green: 0.6680648923, blue: 0.6557773948, alpha: 1)))
                    .font(.system(size: 20, weight: .bold, design: .serif))
                Spacer()
                    .frame(height: 35)
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Spacer()
                    .frame(height: 35)
                
                // Calls to the login function inside of authViewModel to validate the credentials.
                Button("Login") {
                    authViewModel.login(email: email, password: password)
                }
                .padding()
                
                
                NavigationLink {
                    CreateUserView()
                } label: {
                    Text("Create User")
                        .foregroundColor(.blue)
                        .padding()
                }
                
                // Ensures that loading is shown on the page when credentials are being validated.
                if authViewModel.isLoading {
                    Text("Loading...")
                }
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthViewModel())
}
