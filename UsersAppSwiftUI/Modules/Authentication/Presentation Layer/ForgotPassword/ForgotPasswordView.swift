//
//  WelcomeAfterSignUpView.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 21/02/2024.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @StateObject private var viewModel = ForgotPasswordViewModel()
    @State private var emailText = ""
    @State private var errorText = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 30.0) {
            Text("Change password")
                .font(.title)
                .fontWeight(.bold)
            Image(systemName: "lock.circle")
                .font(.system(size: 100))
            Text("Enter your e-mail address. We will send you a link to change your password to this address.")
                .font(.title3)
                .fontWeight(.semibold)
                .fixedSize(horizontal: false, vertical: true)
            TextField(text: $emailText) {
                Text("E-mail")
                    .foregroundStyle(.gray)
                    .fontWeight(.semibold)
            }
            .font(.title)
            .padding()
            .frame(maxWidth: .infinity)
            .modifier(GradientViewBackground())
            .cornerRadius(10)
            .shadow(radius: 15)
            Text(errorText)
                .opacity(errorText.isEmpty ? 0 : 1)
                .lineLimit(nil)
                .minimumScaleFactor(0.5)
                .font(.headline)
                .fontWeight(.semibold)
            Spacer()
            Button(action: {
                Task {
                    do {
                        try await viewModel.resetPassword(email: emailText)
                        errorText = ""
                    } catch {
                        errorText = error.localizedDescription
                    }
                }
            }, label: {
                Text("SEND")
                    .font(.title)
                    .fontWeight(.semibold)
            })
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    ForgotPasswordView()
}
