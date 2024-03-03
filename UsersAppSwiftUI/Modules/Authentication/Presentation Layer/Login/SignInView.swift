//
//  SignInView.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 20/02/2024.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject private var viewModel = SignInViewModel()
    @State private var errorText = ""
    var setRegisterScreen: (() -> Void)?
    var setLoggedState: (() -> Void)?
    
    var body: some View {
        VStack(alignment: .center, spacing: 15.0) {
            Text("Already have an account? Sign in to download users.")
                .font(.title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .lineLimit(2)
                .minimumScaleFactor(0.7)
            Image(systemName: "person")
                .font(.system(size: 70))
            TextField("Email...", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            SecureField("Password...", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            Button {
                Task {
                    do {
                        try await viewModel.signIn()
                        setLoggedState?()
                    } catch let error {
                        errorText = error.localizedDescription
                    }
                }
            } label: {
                Text("Sign In")
                    .padding()
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .modifier(GradientViewBackground())
                    .cornerRadius(10)
            }
            NavigationLink {
                ForgotPasswordView()
            } label: {
                Text("Forgot password?")
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            Text(errorText)
                .opacity(errorText.isEmpty ? 0 : 1)
                .lineLimit(nil)
                .minimumScaleFactor(0.5)
                .font(.headline)
                .fontWeight(.semibold)
            Spacer()
            Button {
                setRegisterScreen?()
            } label: {
                Text("No account? Create one")
                    .font(.headline)
                    .fontWeight(.semibold)
            }
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        SignInView()
    }
}
