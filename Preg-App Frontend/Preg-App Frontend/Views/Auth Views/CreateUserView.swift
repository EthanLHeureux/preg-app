//
//  CreateUserView.swift
//  Preg-App Frontend
//
//  Created by Abraham Gomez Jr on 4/11/26.
//

import SwiftUI

struct CreateUserView: View {

    @EnvironmentObject var authViewModel: AuthViewModel

    @State private var name = ""
    @State private var email = ""
    @State private var dueDate = Date()
    @State private var password = ""
    @State private var currentWeek = ""

    var body: some View {
        VStack {
            
            Text("Pregnancy App")
                .foregroundColor(Color(#colorLiteral(red: 0.7978933454, green: 0.6680648923, blue: 0.6557773948, alpha: 1)))
                .font(.system(size: 20, weight: .bold, design: .serif))
            Spacer()
                .frame(height: 35)
            
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Current Week of Pregnancy", text: $currentWeek)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            
            Spacer()
                .frame(height: 35)


            Button("Create User") {
                authViewModel.createUser(
                    email: email,
                    password: password,
                    name: name,
                    currentWeek: currentWeek,
                    dueDate: dueDate
                )
            }

            if authViewModel.isLoading {
                Text("Loading...")
            }
        }
        .padding()
    }
}

#Preview {
    CreateUserView()
        .environmentObject(AuthViewModel())
}
