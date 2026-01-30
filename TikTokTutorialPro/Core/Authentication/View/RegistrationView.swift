//
//  RegistrationView.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 23/01/26.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var fullname = ""
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel: RegistrationViewModel
    private let authService: AuthService
    init(authService: AuthService) {
        self.authService = authService
        self._viewModel = .init(wrappedValue: RegistrationViewModel(authService: authService))
    }
    var body: some View {
        VStack {
            Spacer()
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
                
                TextField("Enter your full name", text: $fullname)
                    .textInputAutocapitalization(.never)
                    .modifier(StandardTextFieldModifier())
                TextField("Enter your user name", text: $username)
                    .textInputAutocapitalization(.never)
                    .modifier(StandardTextFieldModifier())
            }
            
            // Login Button
            Button {
                Task{await viewModel.createUser(withEmail: email, password: password, username: username, fullname: fullname)}
            } label: {
                Text("Sign up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 350, height: 44)
                    .background(Color.pink)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.vertical)
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1 : 0.5)
            Spacer()
            
            Divider()
            Button {
                dismiss()
            } label: {
                HStack {
                    Text("Already have an account?")
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .padding(.vertical)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && !password.isEmpty
        && email.contains("@")
        && !fullname.isEmpty
        && !username.isEmpty
    }
}

#Preview {
    RegistrationView(authService: AuthService())
}
