//
//  LoginView.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 23/01/26.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
       NavigationStack {
            VStack {
               // Logo Image
                Image("tiktok")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                // TextFields
                VStack {
                    TextField("Enter your email", text: $email)
                        .textInputAutocapitalization(.never)
                        .modifier(StandardTextFieldModifier())
                    SecureField("Enter your password", text: $password)
                        .textInputAutocapitalization(.never)
                        .modifier(StandardTextFieldModifier())
                }
                // Login Button
                
                // go to sign up.
           }
        }
    }
}

#Preview {
    LoginView()
}
