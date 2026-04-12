//
//  LoginView.swift
//  Preg-App Frontend
//
//  Created by Abraham Gomez Jr on 4/11/26.
//

import SwiftUI

struct LoginView: View {

    @EnvironmentObject var authViewModel: AuthViewModel

    @State private var name = ""
    @State private var email = ""
    @State private var dueDate = Date()
    @State private var password = ""
    @State private var cWoP = ""

    var body: some View {
        NavigationStack{
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
