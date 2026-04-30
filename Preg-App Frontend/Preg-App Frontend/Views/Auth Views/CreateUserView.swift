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
    @State private var current_week = ""

    var body: some View {
        NavigationStack {
            VStack {

                Text("Pregnancy App")
                    .font(.system(size: 20, weight: .bold))

                Spacer().frame(height: 35)

                TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("Current Week of Pregnancy", text: $current_week)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)

                Spacer().frame(height: 35)

                // Uses the authViewModel create user function to create the user. All of the user inputed data are arguements.
                Button("Create User") {
                    authViewModel.createUser(
                        email: email,
                        password: password,
                        name: name,
                        current_week: current_week,
                        dueDate: dueDate
                    )
                }

                if authViewModel.isLoading {
                    Text("Loading...")
                }
            }
            .padding()

            // Navigates to LoginView once authViewModel provides confirmation of the creation of a user.
            .navigationDestination(isPresented: $authViewModel.didCreateAccount) {
                LoginView()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}
