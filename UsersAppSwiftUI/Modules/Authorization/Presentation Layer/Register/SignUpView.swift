//
//  SignUpView.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 20/02/2024.
//

import SwiftUI

struct SignUpView: View {
    
    @StateObject private var viewModel = SignUpViewModel()
    @State private var errorText = ""
    var setLoginScreen: (() -> Void)?
    var setLoggedState: (() -> Void)?
    
    var body: some View {
        VStack(alignment: .center, spacing: 15.0) {
            Text("Create an account to download users.")
                .font(.title)
                .fontWeight(.bold)
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
                        try await viewModel.signUp()
                        setLoggedState?()
                    } catch let error {
                        errorText = error.localizedDescription
                    }
                }
            } label: {
                Text("Sign Up")
                    .padding()
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .modifier(GradientViewBackground())
                    .cornerRadius(10)
            }
            Text(errorText)
                .opacity(errorText.isEmpty ? 0 : 1)
                .lineLimit(nil)
                .minimumScaleFactor(0.5)
                .font(.headline)
                .fontWeight(.semibold)
            Spacer()
            Button {
                setLoginScreen?()
            } label: {
                Text("Already have an account? Sign in")
                    .font(.headline)
                    .fontWeight(.semibold)
            }
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        SignUpView()
    }
}
