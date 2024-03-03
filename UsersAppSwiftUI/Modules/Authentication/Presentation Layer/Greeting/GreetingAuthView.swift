//
//  StartView.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 20/02/2024.
//

import SwiftUI

struct GreetingAuthView: View {
    
    var changeAppState: (() -> Void)?
    
    var body: some View {
        VStack(alignment: .center, spacing: 40.0) {
            Text("Hello!")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("If you want to download users, please sign in. If you don't have an account, sign up.")
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .cornerRadius(10)
            Image(systemName: "person")
                .font(.largeTitle)
                .fontWeight(.heavy)
            NavigationLink {
                AuthenticationView(state: .loginScreen,
                                  setLoggedState: { changeAppState?() })
            } label: {
                Text("Sign in")
                    .padding()
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .modifier(GradientViewBackground())
                    .cornerRadius(10)
            }
            NavigationLink {
                AuthenticationView(state: .registerScreen,
                                  setLoggedState: { changeAppState?() })
            } label: {
                Text("Sign up")
                    .padding()
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .modifier(GradientViewBackground())
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Users App")
    }
}

#Preview {
    NavigationStack {
        GreetingAuthView()
    }
}
